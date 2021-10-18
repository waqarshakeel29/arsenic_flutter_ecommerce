import 'package:arsenic_flutter_ecommerce/presentation/auth/welcome/welcome_screen.dart';
import 'package:arsenic_flutter_ecommerce/shared/constants.dart';
import 'package:arsenic_flutter_ecommerce/controller/auth/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/home/bloc.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  // runApp(BlocProvider(create: (context) => sl<LoginBloc>(), child: MyApp()));
  runApp(MultiBlocProvider(child: MyApp(), providers: [
    BlocProvider(create: (context) => sl<LoginBloc>()),
    BlocProvider(create: (context) => sl<HomeBloc>())
  ]));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Builder(builder: (context) {
        return WelcomeScreen();
      }),
      // home: Builder(builder: (context) {
      //   return TestScreen();
      // }),
    );
  }
}

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: MaterialButton(
          child: Center(
            child: Text("CALL"),
          ),
          onPressed: () {
            // print("Button pressed");
            // context.read<LoginBloc>().add(
            //     LoginUserEvent("i170249@nu.edu.pk", "nominomi123"));
          }),
    ));
  }
}
