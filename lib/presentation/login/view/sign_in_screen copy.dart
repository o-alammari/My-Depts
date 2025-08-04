import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:testing_2/app/function/app_status.dart';
import 'package:testing_2/app/function/custom_snack_bar.dart';
import 'package:testing_2/app/widgets/custom_button.dart';
import 'package:testing_2/constant.dart';
import 'package:testing_2/model/model_user.dart';
import 'package:testing_2/presentation/login/view-model/bloc-sign/sign_bloc.dart';
import 'package:testing_2/theme.dart';
import 'package:testing_2/app/widgets/custom_text_field_without_title.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController input1 = TextEditingController();

  TextEditingController input2 = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var enable = true;
    return BlocListener<SignBloc, UserState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Future.delayed(
            const Duration(seconds: 1),
            () {
              customSnackBar(context, 'Sign in success');
              input1.text = input2.text = '';
              Navigator.of(context).pushReplacementNamed(Name.iDHomeScreen);
              // GoRouter.of(context).push(AppRouter.kHomeView);
            },
          );
        } else if (state.status.isError) {
          enable = true;
          customSnackBar(context,
              'SignIn => Error on username or password please try again');
        } else if (state.status.isLoading) {
          enable = false;
          // customSnackBar(context,
          //     'SignIn => Error on username or password please try again');
        }
      },
      child: Scaffold(
        backgroundColor: primaryClr,
        // backgroundColor: Themes.backgroundColor,
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
                            // const Text('Login In',
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
                                onChange: (value) => context
                                    .read<SignBloc>()
                                    .add(UserPasswordChangedEvent(
                                        password: value)),
                                prefixIcon: Icons.lock,
                                widget: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.password,
                                        color: Themes.fontColor))),
                            const SizedBox(height: 30),
                            Center(
                              child: CustomButton(
                                text: 'Sign in',
                                backgroundColor: primaryClr,
                                // backgroundColor: const Color.fromARGB(255, 27, 65, 146),
                                textColor: Colors.white,
                                fontSize: 18,
                                // enable: enable,
                                onPressed: () => context.read<SignBloc>().add(
                                      SignInUserEvent(
                                        signInUser: ModelUser(
                                          // id: idCustomer,
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
                                      .pushNamed(Name.iDSignUpScreen),
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

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//         backgroundColor: Themes.backgroundColor,
//         body: Container(
//           padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
//           child: SingleChildScrollView(
//             child: Form(
//               // key: _formKey,
//               child: Column(
//                 children: [
//                   const Center(
//                     child: Image(
//                       image: AssetImage('assets/images/splash_logo.png'),
//                     ),
//                   ),
//                   const SizedBox(height: 28),
//                   CustomTextField(
//                     title: 'User Name',
//                     hint: 'Enter User',
//                     onChange: (p0) {},
//                   ),
//                   const SizedBox(height: 8),
//                   CustomTextField(
//                     title: 'Password',
//                     hint: '* ',
//                     onChange: (p0) {},
//                   ),
//                   const SizedBox(height: 20),
//                   Center(
//                     child: CustomButton(
//                       text: 'Login',
//                       backgroundColor: const Color.fromARGB(255, 27, 65, 146),
//                       textColor: Colors.white,
//                       fontSize: 18,
//                       onPressed: () {
//                         customSnackBar(context, 'Add to Customer Success');
//                         Navigator.of(context).pushNamed(Name.iDHomeScreen);
//                         //  Navigator.of(context)
//                         //     .pushReplacementNamed(Name.iDHomeScreen);
//                       },
//                     ),
//                   ),
//                   // Padding(
//                   //   padding: const EdgeInsets.only(left: 28, right: 28),
//                   //   child: TextFormField(
//                   //     keyboardType: TextInputType.emailAddress,
//                   //     // controller: _userNameController,
//                   //     decoration: const InputDecoration(
//                   //       hintText: ' AppStrings.username.tr()',
//                   //       labelText: 'AppStrings.username.tr()',
//                   //       // errorText:
//                   //       // errorText: (snapshot.data ?? true)
//                   //       //     ? null
//                   //       //     : AppStrings.usernameError.tr(),
//                   //     ),
//                   //   ),
//                   // ),
//                   // const SizedBox(height: 28),
//                   // Padding(
//                   //   padding: const EdgeInsets.only(left: 28, right: 28),
//                   //   child: TextFormField(
//                   //     keyboardType: TextInputType.visiblePassword,
//                   //     // controller: _userPasswordController,
//                   //     decoration: InputDecoration(
//                   //       hintText: 'AppStrings.password.tr()',
//                   //       labelText: 'AppStrings.password.tr()',
//                   //       // errorText: (snapshot.data ?? true)
//                   //       //     ? null
//                   //       //     : AppStrings.passwordError.tr(),
//                   //     ),
//                   //   ),
//                   // ),
//                   // const SizedBox(height: 28),
//                   // const Padding(
//                   //   padding: EdgeInsets.only(left: 28, right: 28),
//                   //   child: SizedBox(
//                   //     width: double.infinity,
//                   //     height: 40,
//                   //     child: ElevatedButton(
//                   //       onPressed: null,
//                   //       // onPressed: (snapshot.data ?? false)
//                   //       //     ? () {
//                   //       //         _viewModel.login();
//                   //       //       }
//                   //       //     : null,
//                   //       child: Text('AppStrings.login.tr()'),
//                   //     ),
//                   //   ),
//                   // ),

//                   // Padding(
//                   //   padding: const EdgeInsets.only(
//                   //     top: 8,
//                   //     left: 28,
//                   //     // right: AppPadding.p28,
//                   //   ),
//                   //   child: Row(
//                   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //     children: [
//                   //       TextButton(
//                   //         onPressed: () {
//                   //           // Navigator.pushNamed(
//                   //           //   context,
//                   //           //   Routes.forgotPasswordRoute,
//                   //           // );
//                   //         },
//                   //         child: Text(
//                   //           'forgetPassword',
//                   //           style: Theme.of(context).textTheme.titleMedium,
//                   //         ),
//                   //       ),
//                   //       TextButton(
//                   //         onPressed: () {
//                   //           // Navigator.pushNamed(
//                   //           //   context,
//                   //           //   Routes.registerRoute,
//                   //           // );
//                   //         },
//                   //         child: Text(
//                   //           'registerText',
//                   //           style: Theme.of(context).textTheme.titleMedium,
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//         ));

//   }
// }
