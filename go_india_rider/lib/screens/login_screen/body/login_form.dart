import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_rider/package/custom_button/el_button.dart';
import 'package:go_india_rider/utility/constants/export.dart';

import '../../../package/input_fields/input_fields.dart';
import '../export.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = get<LoginCubit>();
    var theme = Theme.of(context);
    return BlocBuilder<LoginCubit, LoginState>(
      bloc: cubit,
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              PhoneInputField(
                autoFocus: true,
                filledColor: theme.colorScheme.primary.withOpacity(0.1),
                hint: state.phoneNumber.value.isEmpty
                    ? 'e.g: xxxxxxxxxx'
                    : state.phoneNumber.value,
                phone: state.phoneNumber.isValid
                    ? TextEditingController(text: state.phoneNumber.value)
                    : null,
                initialNumber: state.phoneNumber.value,
                onNumberChange: (number) => cubit.numberChanged(number.number),
                error: state.phoneNumber.displayError != null
                    ? 'invalid phone number'
                    : null,
                onDone: (value) {
                  if (state.isValid) {
                    context.read<LoginCubit>().context = context;
                    context.read<LoginCubit>().checkPhoneNo();
                  }
                  return;
                },
                validator: (value) => state.phoneNumber.displayError != null
                    ? 'invalid phone number'
                    : null,
                onCountryChange: (value) {},
              ),
              const SizedBox(height: 20),
              Hero(
                tag: "login_btn",
                child: ElButton(
                  press: () {},
                  text: "Login".toUpperCase(),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}
