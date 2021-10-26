import 'package:arsenic_flutter_ecommerce/controller/home/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  final String uid;

  const DetailScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Got uid: ");
    print(uid);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Body(
        uid: this.uid,
      ),
    );
  }
}
