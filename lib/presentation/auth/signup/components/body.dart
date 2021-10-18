import 'package:arsenic_flutter_ecommerce/controller/auth/login_bloc.dart';
import 'package:arsenic_flutter_ecommerce/controller/auth/login_event.dart';
import 'package:arsenic_flutter_ecommerce/controller/auth/login_state.dart';
import 'package:arsenic_flutter_ecommerce/presentation/auth/login/login_screen.dart';
import 'package:arsenic_flutter_ecommerce/presentation/auth/signup/components/social_icon.dart';
import 'package:arsenic_flutter_ecommerce/shared/components/already_have_an_account_acheck.dart';
import 'package:arsenic_flutter_ecommerce/shared/components/rounded_button.dart';
import 'package:arsenic_flutter_ecommerce/shared/components/rounded_input_field.dart';
import 'package:arsenic_flutter_ecommerce/shared/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';

import '../../../../injection_container.dart';
import '../../../../main.dart';
import 'background.dart';

class Body extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener(
      bloc: sl<LoginBloc>(),
      listener: (BuildContext context, state) {
        if (state is LoadedState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => TestScreen()),
              (Route<dynamic> route) => false);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
          bloc: sl<LoginBloc>(),
          builder: (buildContext, state) {
            return Background(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "SIGNUP",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height * 0.03),
                    SvgPicture.asset(
                      "assets/icons/signup.svg",
                      height: size.height * 0.35,
                    ),
                    RoundedInputField(
                      hintText: "Name",
                      onChanged: (value) {},
                      controller: nameController,
                    ),
                    RoundedInputField(
                      hintText: "Email",
                      onChanged: (value) {},
                      controller: emailController,
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                      controller: passwordController,
                    ),
                    state is LoadingState
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: CircularProgressIndicator(),
                          )
                        : RoundedButton(
                            text: "SIGNUP",
                            press: () {
                              context.read<LoginBloc>().add(SignUpUserEvent(
                                  nameController.text.trim(),
                                  emailController.text.trim(),
                                  passwordController.text.trim()));
                            },
                          ),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                    // OrDivider(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     SocalIcon(
                    //       iconSrc: "assets/icons/facebook.svg",
                    //       press: () {},
                    //     ),
                    //     SocalIcon(
                    //       iconSrc: "assets/icons/twitter.svg",
                    //       press: () {},
                    //     ),
                    //     SocalIcon(
                    //       iconSrc: "assets/icons/google-plus.svg",
                    //       press: () {},
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
