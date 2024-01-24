import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_rider/navigation_system/export.dart';
import 'package:pinput/pinput.dart';
import 'package:go_router/go_router.dart';
import '../../package/package/package.dart';
import '../../utility/utils.dart';
import 'log_in_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.notifier) : super(const LoginState());

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

  Future<void> checkPhoneNo() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    // await _driverRepository
    //     .checkPhoneNo({"mobile": state.phoneNumber.value}).then(
    //   (value) => value.fold(
    //     (l) {
    //       'hello$l'.log();
    //       emit(state.copyWith(
    //         status: FormzSubmissionStatus.failure,
    //         errorMessage: l.message,
    //       ));
    //     },
    //     (r) {
    //       if (r) {
    //         emit(state.copyWith(status: FormzSubmissionStatus.success));
    //         _detailsRepository
    //             .getVehicleDetails({'driver_id': get<DriverStore>().state.id});
    //       } else {
    //         sendOpt();
    //       }
    //     },
    //   ),
    // );
  }

  Future<void> sendOpt() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    // await _authRepository.sendOtp(
    //   phoneNumber: state.phoneNumber.phoneNoWithCountryCode,
    //   codeSend: (String vid, int? token) async {
    //     emit(state.copyWith(status: FormzSubmissionStatus.success));
    //     context.go(RouteName.otp.path,
    //         extra: OtpPageInitialParams(
    //           vID: vid,
    //           token: token,
    //           phoneNO: state.phoneNumber,
    //         ));
    //   },
    //   pvFailed: (FirebaseAuthException e) {
    //     e.log();
    //     var left = FirebaseSendOtpFailure.fromCode(e.code);
    //     emit(state.copyWith(
    //         errorMessage: left.message, status: FormzSubmissionStatus.failure));
    //   },
    // );
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
}
