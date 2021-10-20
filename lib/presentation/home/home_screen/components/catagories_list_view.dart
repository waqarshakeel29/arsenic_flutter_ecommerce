import 'package:arsenic_flutter_ecommerce/controller/home/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class CatagoriesListModel {
  final String itemText;
  bool isSelcted;

  CatagoriesListModel({required this.itemText, this.isSelcted = false});
}

class CatagoriesListFilter extends StatefulWidget {
  final itemCount;
  final List<CatagoriesListModel> catagoriesList;

  CatagoriesListFilter(
      {Key? key, required this.itemCount, required this.catagoriesList})
      : super(key: key);

  @override
  State<CatagoriesListFilter> createState() => _CatagoriesListFilterState();
}

class _CatagoriesListFilterState extends State<CatagoriesListFilter> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 7),
            mainAxisSpacing: 10),
        itemCount: this.widget.itemCount,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.catagoriesList[index].isSelcted =
                      !widget.catagoriesList[index].isSelcted;
                });
                // context.read<HomeBloc>().add(FilterEvent(widget.horizontalList
                //     .where((element) => element.isSelcted)
                //     .map((e) => e.itemText)
                //     .toList()));
                // context
                //     .read<HomeBloc>()
                //     .add(FilterEvent(widget.catagoriesList[index].itemText));
              },
              child: Container(
                  constraints: BoxConstraints(minWidth: 70),
                  decoration: BoxDecoration(
                    color: widget.catagoriesList[index].isSelcted
                        ? Colors.red
                        : Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      widget.catagoriesList[index].itemText,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ))),
            ),
          );
        });
  }
}
