import 'package:arsenic_flutter_ecommerce/controller/home/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  final String uid;

  const HomeScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Got uid: ");
    print(uid);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: 70,
        title: Image(
          image: NetworkImage(
              "https://logowik.com/content/uploads/images/flutter5786.jpg"),
          height: 40,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              // size: 30,
            ),
          )
        ],
      ),
      body: Body(
        uid: this.uid,
      ),
      drawer: Drawer(),
    );
  }
}
