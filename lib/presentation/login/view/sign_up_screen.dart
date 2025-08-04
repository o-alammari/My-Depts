import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_2/app/function/app_status.dart';
import 'package:testing_2/constant.dart';
import 'package:testing_2/app/function/custom_snack_bar.dart';
import 'package:testing_2/model/model_user.dart';
import 'package:testing_2/presentation/login/view-model/bloc-sign/sign_bloc.dart';
import 'package:testing_2/theme.dart';
import 'package:testing_2/app/widgets/custom_button.dart';
import 'package:testing_2/app/widgets/custom_text_field_without_title.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController input1 = TextEditingController();

  TextEditingController input2 = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignBloc, UserState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          input1.text = input2.text = '';
          customSnackBar(context, 'Sign up success');
          Navigator.of(context).pushReplacementNamed(Name.iDHomeScreen);
        } else if (state.status.isError) {
          customSnackBar(
              context, 'Type Error => Sign up Error please try again');
        }
      },
      builder: (context, state) => Scaffold(
        // backgroundColor: Themes.backgroundColor,
        backgroundColor: primaryClr,
        // backgroundColor: const Color.fromARGB(255, 247, 235, 235),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: primaryClr,
                pinned: true,
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      color: primaryClr,
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 50, left: 20, right: 20),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 247, 235, 235),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Form(
                          // key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              const Text('Sign up',
                                  style: TextStyle(
                                    color: primaryClr,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  )),
                              const SizedBox(height: 20),
                              CustomTextFieldWithoutTitle(
                                hint: 'Full name',
                                // controller: input1,
                                onChange: (p0) {},
                                // onChange: (value) => context
                                //     .read<SignBloc>()
                                //     .add(UserNameChangedEvent(userName: value)),
                                // prefixIcon: Icons.person,
                              ),
                              const SizedBox(height: 10),
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
                                onChange: (value) => context
                                    .read<SignBloc>()
                                    .add(UserPasswordChangedEvent(
                                        password: value)),
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
                                  text: 'Sign up',
                                  // text: 'Register',
                                  // backgroundColor: const Color.fromARGB(255, 27, 65, 146),
                                  backgroundColor: primaryClr,
                                  textColor: Colors.white,
                                  fontSize: 18,
                                  onPressed: () => context.read<SignBloc>().add(
                                        SignUpUserEvent(
                                          signUpUser: ModelUser(
                                            // id: idCustomer,
                                            userName: input1.text,
                                            password: input2.text,
                                          ),
                                        ),
                                      ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                      color: Themes.fontColor,
                                      fontSize: 17,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.of(context)
                                        .pushReplacementNamed(
                                            Name.iDSignInScreen),
                                    child: const Text(
                                      'Sign in',
                                      style: TextStyle(
                                        color: primaryClr,
                                        fontSize: 17,
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
