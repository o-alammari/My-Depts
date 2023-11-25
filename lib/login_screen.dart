import 'package:flutter/material.dart';
import 'package:testing_2/constant.dart';
import 'package:testing_2/function/custom_snack_bar.dart';
import 'package:testing_2/theme.dart';
import 'package:testing_2/widgets/custom_button.dart';
import 'package:testing_2/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Themes.backgroundColor,
        body: Container(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              // key: _formKey,
              child: Column(
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage('assets/images/splash_logo.png'),
                    ),
                  ),
                  const SizedBox(height: 28),
                  InputField1(
                    title: 'User Name',
                    hint: 'Enter User',
                    onChange: (p0) {},
                    
                  ),
                  const SizedBox(height: 8),
                  InputField1(title: 'Password', hint: '* ', onChange: (p0) {}),
                  const SizedBox(height: 20),
                  Center(
                    child: CustomButton(
                      text: 'Login',
                      backgroundColor: const Color.fromARGB(255, 27, 65, 146),
                      textColor: Colors.white,
                      fontSize: 18,
                      onPressed: () {
                        customSnackBar(context, 'Add to Customer Success');
                        Navigator.of(context).pushNamed(Name.iDHomeScreen);
                        //  Navigator.of(context)
                        //     .pushReplacementNamed(Name.iDHomeScreen);
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 28, right: 28),
                  //   child: TextFormField(
                  //     keyboardType: TextInputType.emailAddress,
                  //     // controller: _userNameController,
                  //     decoration: const InputDecoration(
                  //       hintText: ' AppStrings.username.tr()',
                  //       labelText: 'AppStrings.username.tr()',
                  //       // errorText:
                  //       // errorText: (snapshot.data ?? true)
                  //       //     ? null
                  //       //     : AppStrings.usernameError.tr(),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 28),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 28, right: 28),
                  //   child: TextFormField(
                  //     keyboardType: TextInputType.visiblePassword,
                  //     // controller: _userPasswordController,
                  //     decoration: InputDecoration(
                  //       hintText: 'AppStrings.password.tr()',
                  //       labelText: 'AppStrings.password.tr()',
                  //       // errorText: (snapshot.data ?? true)
                  //       //     ? null
                  //       //     : AppStrings.passwordError.tr(),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 28),
                  // const Padding(
                  //   padding: EdgeInsets.only(left: 28, right: 28),
                  //   child: SizedBox(
                  //     width: double.infinity,
                  //     height: 40,
                  //     child: ElevatedButton(
                  //       onPressed: null,
                  //       // onPressed: (snapshot.data ?? false)
                  //       //     ? () {
                  //       //         _viewModel.login();
                  //       //       }
                  //       //     : null,
                  //       child: Text('AppStrings.login.tr()'),
                  //     ),
                  //   ),
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     top: 8,
                  //     left: 28,
                  //     // right: AppPadding.p28,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       TextButton(
                  //         onPressed: () {
                  //           // Navigator.pushNamed(
                  //           //   context,
                  //           //   Routes.forgotPasswordRoute,
                  //           // );
                  //         },
                  //         child: Text(
                  //           'forgetPassword',
                  //           style: Theme.of(context).textTheme.titleMedium,
                  //         ),
                  //       ),
                  //       TextButton(
                  //         onPressed: () {
                  //           // Navigator.pushNamed(
                  //           //   context,
                  //           //   Routes.registerRoute,
                  //           // );
                  //         },
                  //         child: Text(
                  //           'registerText',
                  //           style: Theme.of(context).textTheme.titleMedium,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ));
  }
}
