import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_debts/app/function/app_status.dart';
import 'package:my_debts/app/function/custom_snack_bar.dart';
import 'package:my_debts/app/widgets/custom_button.dart';
import 'package:my_debts/app/utils/constant.dart';
import 'package:my_debts/model/model_user.dart';
import 'package:my_debts/presentation/login/view-model/bloc-sign/sign_bloc.dart';
import 'package:my_debts/app/utils/theme.dart';
import 'package:my_debts/app/widgets/custom_text_field_without_title.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController input1 = TextEditingController();

  TextEditingController input2 = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var enable = false;
    return BlocConsumer<SignBloc, UserState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          input1.text = input2.text = '';
          customSnackBar(context, 'Sign in success');
          Navigator.of(context).pushReplacementNamed(Name.iDHomeScreen);
        } else if (state.status.isError) {
          enable = true;
          customSnackBar(context,
              'SignIn => Error on username or password please try again');
        } else if (state.status.isInitial) {
          enable = false;
        } else if (state.status.isLoading) {
          enable = true;
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: primaryClr,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      color: primaryClr,
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 50, left: 20, right: 20),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 247, 235, 235),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(23),
                            topRight: Radius.circular(23),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Text('Sign in',
                                style: TextStyle(
                                  color: primaryClr,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                )),
                            const SizedBox(height: 20),
                            CustomTextFieldWithoutTitle(
                              hint: 'User name',
                              controller: input1,
                              onChange: (value) => context
                                  .read<SignBloc>()
                                  .add(UserNameChangedEvent(userName: value)),
                              prefixIcon: Icons.person,
                            ),
                            const SizedBox(height: 10),
                            CustomTextFieldWithoutTitle(
                              hint: 'Password',
                              controller: input2,
                              obscureText: true,
                              visibilityPass: true,
                              onChange: (value) => context.read<SignBloc>().add(
                                  UserPasswordChangedEvent(password: value)),
                              prefixIcon: Icons.lock,
                              widget: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.password,
                                    color: Themes.fontColor),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Center(
                              child: CustomButton(
                                text: 'Sign in',
                                backgroundColor: state.status.isLoading
                                    ? const Color.fromARGB(255, 189, 145, 126)
                                    : primaryClr,
                                textColor: Colors.white,
                                fontSize: 18,
                                onPressed: state.status.isLoading
                                    ? null
                                    : () => context.read<SignBloc>().add(
                                          SignInUserEvent(
                                            signInUser: ModelUser(
                                              userName: input1.text,
                                              password: input2.text,
                                            ),
                                          ),
                                        ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: TextButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(Name.iDSignInScreen),
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: primaryClr,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                    color: Themes.fontColor,
                                    fontSize: 18,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushReplacementNamed(
                                          Name.iDSignUpScreen),
                                  child: const Text(
                                    'Sign up now',
                                    style: TextStyle(
                                      color: primaryClr,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
