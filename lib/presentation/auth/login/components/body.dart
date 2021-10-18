import 'package:arsenic_flutter_ecommerce/controller/auth/login_bloc.dart';
import 'package:arsenic_flutter_ecommerce/controller/auth/login_event.dart';
import 'package:arsenic_flutter_ecommerce/controller/auth/login_state.dart';
import 'package:arsenic_flutter_ecommerce/presentation/auth/signup/signup_screen.dart';
import 'package:arsenic_flutter_ecommerce/presentation/home/home_screen/home_screen.dart';
import 'package:arsenic_flutter_ecommerce/shared/components/already_have_an_account_acheck.dart';
import 'package:arsenic_flutter_ecommerce/shared/components/rounded_button.dart';
import 'package:arsenic_flutter_ecommerce/shared/components/rounded_input_field.dart';
import 'package:arsenic_flutter_ecommerce/shared/components/rounded_password_field.dart';
import 'package:arsenic_flutter_ecommerce/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../injection_container.dart';
import 'background.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener(
      bloc: sl<LoginBloc>(),
      listener: (BuildContext context, state) {
        if (state is LoadedState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(uid: state.appUser.uid)));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
          bloc: sl<LoginBloc>(),
          builder: (buildContext, state) {
            // if (state is LoadingState) {
            //   return const CircularProgressIndicator();
            // }
            return Background(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "LOGIN",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height * 0.03),
                    SvgPicture.asset(
                      "assets/icons/login.svg",
                      height: size.height * 0.35,
                    ),
                    SizedBox(height: size.height * 0.03),
                    RoundedInputField(
                      hintText: "Your Email",
                      onChanged: (value) {},
                      controller: emailController,
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                      controller: passwordController,
                    ),
                    state is LoadingState
                        ? const Padding(
                            padding: EdgeInsets.all(10),
                            child: CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          )
                        : RoundedButton(
                            text: "LOGIN",
                            press: () {
                              print("button pressed");
                              context.read<LoginBloc>().add(LoginUserEvent(
                                  "i170249@nu.edu.pk", "nominomi123"));
                            },
                          ),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
