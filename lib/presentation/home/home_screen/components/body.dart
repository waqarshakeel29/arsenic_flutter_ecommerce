import 'package:arsenic_flutter_ecommerce/controller/home/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import 'background.dart';

class Body extends StatelessWidget {
  final String uid;

  Body({
    Key? key,
    required this.uid,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(FetchItemsEvent(uid));
    Size size = MediaQuery.of(context).size;
    print("BODY BUILD");
    return BlocListener(
      bloc: sl<HomeBloc>(),
      listener: (BuildContext context, state) {
        // print(state);
        if (state is InitialState) {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
          print("Initial State");
          // context.read<HomeBloc>().add(FetchItemsEvent(uid));
        }
      },
      child: Background(
        child: BlocBuilder<HomeBloc, HomeState>(
            bloc: sl<HomeBloc>(),
            builder: (buildContext, state) {
              if (state is LoadingState) {
                print("State Loading");
                return Center(child: const CircularProgressIndicator());
              } else if (state is LoadedState) {
                print("LIST RECEIVED");
                print(state.listStoreItems);

                return Padding(
                  padding: const EdgeInsets.only(top: 130, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Our Products",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          const Text(
                            "Sort By",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Container(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List<String>.generate(
                                    100, (i) => (i + 1).toString())
                                .map((String string) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(string),
                              );
                            }).toList(),
                          )),
                      Expanded(
                          child: ListView(
                        children: List<String>.generate(
                                100, (i) => (i + 1).toString())
                            .map((String string) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(string),
                          );
                        }).toList(),
                      ))
                    ],
                  ),
                );
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}
