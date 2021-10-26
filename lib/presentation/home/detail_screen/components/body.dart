import 'package:arsenic_flutter_ecommerce/controller/home/bloc.dart';
import 'package:arsenic_flutter_ecommerce/main.dart';
import 'package:arsenic_flutter_ecommerce/presentation/home/home_screen/components/catagories_list_view.dart';
import 'package:arsenic_flutter_ecommerce/presentation/home/home_screen/components/horizontal_list_filter.dart';
import 'package:arsenic_flutter_ecommerce/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import 'background.dart';

class Body extends StatefulWidget {
  final String uid;

  Body({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("BODY BUILD");
    return BlocListener(
      bloc: sl<HomeBloc>(),
      listener: (BuildContext context, state) {
        // print(state);
        if (state is LoadedCatatoryState) {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => TestScreen()));
          print("Initial State");
          // context.read<HomeBloc>().add(FetchItemsEvent(uid));
        }
      },
      child: Background(
        child: BlocBuilder<HomeBloc, HomeState>(
            bloc: sl<HomeBloc>(),
            builder: (buildContext, state) {
              return CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    backgroundColor: Colors.white,
                    expandedHeight: 30,
                    collapsedHeight: 350,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image(

                          // fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://i.insider.com/5e38419b5bc79c4c7d4e1192?width=906&format=jpeg")),
                    ),
                  ),
                  SliverAppBar(
                    backgroundColor: Colors.green,
                    title: Text('Have a nice day'),
                    floating: true,
                    leading: Container(),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Card(
                          margin: const EdgeInsets.all(15),
                          child: Container(
                            color: Colors.blue[100 * (index % 9 + 1)],
                            height: 200,
                            alignment: Alignment.center,
                            child: Text(
                              "Item $index",
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                        );
                      },
                      childCount: 3, // 1000 list items
                    ),
                  ),
                ],
              );

              // if (state is LoadingState) {
              //   print("State Loading");
              //   return Center(child: const CircularProgressIndicator());
              // } else if (state is LoadedState) {
              //   print("LIST RECEIVED");
              //   print(state.listStoreItems);

              //   return Padding(
              //     padding: const EdgeInsets.only(top: 130, left: 20, right: 20),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: <Widget>[
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             const Text(
              //               "Our Products",
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 30),
              //             ),
              //             const Text(
              //               "Sort By",
              //               style: TextStyle(fontSize: 15),
              //             ),
              //           ],
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(top: 10, bottom: 10),
              //           child: Container(
              //             height: 45,
              //             child: HorizontalListFilter(
              //               itemCount: 4,
              //               horizontalList: [
              //                 HorizontalListModel(
              //                     itemText: "All", isSelcted: true),
              //                 HorizontalListModel(itemText: "Catagories"),
              //                 HorizontalListModel(itemText: "Top"),
              //                 HorizontalListModel(itemText: "Recommendations"),
              //               ],
              //             ),
              //           ),
              //         ),
              //         Expanded(
              //             child: ListView(
              //           children: List<String>.generate(
              //                   100, (i) => (i + 1).toString())
              //               .map((String string) {
              //             return Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Text(string),
              //             );
              //           }).toList(),
              //         ))
              //       ],
              //     ),
              //   );
              // } else {
              //   return Container();
              // }
            }),
      ),
    );
  }
}
