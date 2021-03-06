import 'package:arsenic_flutter_ecommerce/controller/home/bloc.dart';
import 'package:arsenic_flutter_ecommerce/main.dart';
import 'package:arsenic_flutter_ecommerce/presentation/home/detail_screen/detail_screen.dart';
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
  bool isGrid = false;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final HorizontalListFilter horizontalListView = HorizontalListFilter(
    itemCount: 4,
    horizontalList: [
      "All",
      "Catagories",
      "Top",
      "Recommendations",
    ],
  );

  final CatagoriesListFilter catagoriesListFilter = CatagoriesListFilter(
    itemCount: 5,
    catagoriesList: [
      CatagoriesListModel(itemText: "shirt"),
      CatagoriesListModel(itemText: "shoes"),
      CatagoriesListModel(itemText: "watches"),
      CatagoriesListModel(itemText: "shorts"),
      CatagoriesListModel(itemText: "polo"),
      CatagoriesListModel(itemText: "jeans"),
      CatagoriesListModel(itemText: "slippers"),
    ],
  );

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchItemsEvent(widget.uid));
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
              return Padding(
                  padding: const EdgeInsets.only(top: 130, left: 15, right: 15),
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
                            Row(
                              children: [
                                const Text(
                                  "Sort By",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isGrid = !isGrid;
                                    });
                                  },
                                  child: Icon(isGrid
                                      ? Icons.grid_view_outlined
                                      : Icons.view_list_outlined),
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Container(
                            height: 45,
                            child: horizontalListView,
                          ),
                        ),
                        Expanded(
                          child: (() {
                            if (state is LoadingState) {
                              return Center(
                                  child: const CircularProgressIndicator());
                            } else if (state is LoadedState) {
                              return MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: isGrid
                                    ? ListView.builder(
                                        itemCount: state.listStoreItems.length,
                                        itemBuilder: (_, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailScreen(
                                                              uid: widget.uid,
                                                            )));
                                              },
                                              child: Container(
                                                height: 120,
                                                width: size.width,
                                                decoration: BoxDecoration(
                                                    color: kPrimaryLightColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image(
                                                            height: 100,
                                                            width: 100,
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                                "https://i.insider.com/5e38419b5bc79c4c7d4e1192?width=906&format=jpeg")),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            state
                                                                .listStoreItems[
                                                                    index]
                                                                .itemName,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18),
                                                          ),
                                                          Text(
                                                            state
                                                                .listStoreItems[
                                                                    index]
                                                                .itemName,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16),
                                                          ),
                                                          Text(
                                                            "AED " +
                                                                state
                                                                    .listStoreItems[
                                                                        index]
                                                                    .itemPrice
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        })
                                    : GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio:
                                              (size.height / size.width) * 0.4,
                                          mainAxisSpacing: 4.0,
                                          crossAxisSpacing: 4.0,
                                        ),
                                        itemCount: state.listStoreItems.length,
                                        itemBuilder: (_, index) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: size.width,
                                            decoration: BoxDecoration(
                                                color: kPrimaryLightColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image(
                                                        height: 100,
                                                        width: 100,
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                            "https://i.insider.com/5e38419b5bc79c4c7d4e1192?width=906&format=jpeg")),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        state
                                                            .listStoreItems[
                                                                index]
                                                            .itemName,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16),
                                                      ),
                                                      Text(
                                                        "AED " +
                                                            state
                                                                .listStoreItems[
                                                                    index]
                                                                .itemPrice
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 17),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                              );
                            } else if (state is LoadedCatatoryState) {
                              return Column(
                                children: [
                                  Flexible(
                                      flex: 2,
                                      child: MediaQuery.removePadding(
                                          context: context,
                                          removeTop: true,
                                          child: catagoriesListFilter)),
                                  Flexible(
                                      flex: 1,
                                      child: MaterialButton(
                                          child: Container(
                                              height: 70,
                                              constraints:
                                                  BoxConstraints(minWidth: 70),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                              ),
                                              child: Center(
                                                  child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 20),
                                                child: Text(
                                                  "Continue",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              ))),
                                          onPressed: () {
                                            context.read<HomeBloc>().add(
                                                FilterCatagoriesEvent(
                                                    catagoriesListFilter
                                                        .catagoriesList
                                                        .where((element) =>
                                                            element.isSelcted)
                                                        .map((e) => e.itemText)
                                                        .toList()));
                                          }))
                                ],
                              );
                            } else {
                              return Container();
                            }
                          }()),
                        ),
                      ]));

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




// import 'package:arsenic_flutter_ecommerce/controller/home/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../injection_container.dart';
// import 'background.dart';

// class Body extends StatelessWidget {
//   final String uid;

//   Body({
//     Key? key,
//     required this.uid,
//   }) : super(key: key);

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     context.read<HomeBloc>().add(FetchItemsEvent(uid));
//     Size size = MediaQuery.of(context).size;
//     print("BODY BUILD");
//     return BlocListener(
//       bloc: sl<HomeBloc>(),
//       listener: (BuildContext context, state) {
//         // print(state);
//         if (state is InitialState) {
//           // Navigator.push(
//           //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
//           print("Initial State");
//           // context.read<HomeBloc>().add(FetchItemsEvent(uid));
//         }
//       },
//       child: Background(
//         child: BlocBuilder<HomeBloc, HomeState>(
//             bloc: sl<HomeBloc>(),
//             builder: (buildContext, state) {
//               if (state is LoadingState) {
//                 print("State Loading");
//                 return Center(child: const CircularProgressIndicator());
//               } else if (state is LoadedState) {
//                 print("LIST RECEIVED");
//                 print(state.listStoreItems);

//                 return Padding(
//                   padding: const EdgeInsets.only(top: 130, left: 20, right: 20),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             "Our Products",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 30),
//                           ),
//                           const Text(
//                             "Sort By",
//                             style: TextStyle(fontSize: 15),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10, bottom: 10),
//                         child: Container(
//                             height: 45,
//                             child: ListView(
//                               scrollDirection: Axis.horizontal,
                              
//                               children: [
//                                 "All",
//                                 "Catagories",
//                                 "Top",
//                                 "Recommendations"
//                               ].map((String string) {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(right: 10),
//                                   child: GestureDetector(
//                                     onTap: () {},
//                                     child: Container(
//                                         constraints:
//                                             BoxConstraints(minWidth: 70),
//                                         decoration: BoxDecoration(
//                                           color: Colors.grey,
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(20)),
//                                         ),
//                                         child: Center(
//                                             child: Padding(
//                                           padding: const EdgeInsets.only(
//                                               left: 20, right: 20),
//                                           child: Text(
//                                             string,
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 17),
//                                           ),
//                                         ))),
//                                   ),
//                                 );
//                               }).toList(),
                            
//                             )),
//                       ),
//                       Expanded(
//                           child: ListView(
//                         children: List<String>.generate(
//                                 100, (i) => (i + 1).toString())
//                             .map((String string) {
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(string),
//                           );
//                         }).toList(),
//                       ))
//                     ],
//                   ),
//                 );
//               } else {
//                 return Container();
//               }
//             }),
//       ),
//     );
//   }
// }
