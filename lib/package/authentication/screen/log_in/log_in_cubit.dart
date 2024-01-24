import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import '../../../../domain/repository/repository.dart';
import '../../../../domain/store/store.dart';
import '../../../../utility/utility/utility.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
import '../../../package/package.dart';
import 'log_in_state.dart';
import '../otp/export.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository, this._driverRepository,
      this._detailsRepository, this.notifier)
      : super(const LoginState());

  final AuthRepository _authRepository;
  final DriverRepository _driverRepository;
  final DriverDetailsRepository _detailsRepository;
  final Notifier notifier;
  late BuildContext context;

  void numberChanged(String value) {
    final phone = MobileNumber.dirty(value);
    emit(
      state.copyWith(
        phoneNumber: phone,
        isValid: Formz.validate([phone]),
      ),
    );
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.logInWithGoogle();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithGoogleFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<void> checkPhoneNo() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    await _driverRepository.checkPhoneNo({
      "mobile": state.phoneNumber.value
    }).then((value) => value.fold(
          (l) {
            'hello$l'.log();
            emit(state.copyWith(
              status: FormzSubmissionStatus.failure,
              errorMessage: l.message,
            ));
            throw l.message;
          },
          (r) async {
            if (r) {
              emit(state.copyWith(status: FormzSubmissionStatus.success));
              _detailsRepository.getVehicleDetails(
                  {'driver_id': get<DriverStore>().state.id});
            } else {
              await sendOpt();
            }
          },
        ));
  }

  // xcopy G:\Users\deepb\desktop\joy\universal_lab E:\01 AA\Flutter projects\ /E /H /C /K /R /Y
  // xcopy universal_lab E:\01 AA\Flutter projects\ /E /H /C /K /R /Y
  // keytool -list -v -alias androiddebugkey -keystore "C:\Users\BISHNU DADA\.android\debug.keystore"
  // keytool -list -v -alias androiddebugkey -keystore "E:\01 AA\Flutter projects\go_india\your-release-key.keystore"
  // keytool -list -v -keystore "E:\01 AA\Flutter projects\go_india\your-release-key.keystore"

  // keytool -list -v -alias androiddebugkey -keystore C:\Users\BISHNU%DADA\.android\debug.keystore
  // keytool -list -v -alias androiddebugkey -keystore C:\Users\Public\debug.keystore
  // keytool -genkeypair -v -keystore "C:\Users\BISHNU DADA\.android\debug.keystore" -keyalg RSA -keysize 2048 -sigalg SHA256withRSA -validity 3650
  // keytool -genkeypair -v -keystore C:\MyKeystores\new_keystore.keystore -keyalg RSA -keysize 2048 -sigalg SHA256withRSA -validity 3650

  Future<void> sendOpt() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await _authRepository.sendOtp(
      phoneNumber: state.phoneNumber.phoneNoWithCountryCode,
      codeSend: (String vid, int? token) async {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
        context.go(Screen.otp.path,
            extra: OtpPageInitialParams(
              vID: vid,
              token: token,
              phoneNO: state.phoneNumber,
            ));
      },
      pvFailed: (FirebaseAuthException e) {
        e.log();
        var left = FirebaseSendOtpFailure.fromCode(e.code);

        notifier.errorMessage(context: context, message: left.message);
        emit(state.copyWith(
            errorMessage: left.message, status: FormzSubmissionStatus.failure));
      },
    );
  }

  static void listener(BuildContext context, LoginState state) {
    if (state.status.isFailure) {
      context.read<LoginCubit>().notifier.errorMessage(
            context: context,
            message: state.errorMessage ?? "Authentication Failure",
          );
    }
  }

  Future hintProvider() async {
    var appSing = await smartAuth.getAppSignature();
    appSing.log();
    Credential? res = await smartAuth.requestHint(
      isPhoneNumberIdentifierSupported: true,
      showCancelButton: true,
    );
    if (res == null) return;
    numberChanged(res.id.removeCountryCode);
  }

  smsTwo() async => await autoFill.getAppSignature.then((value) => value.log());
}
