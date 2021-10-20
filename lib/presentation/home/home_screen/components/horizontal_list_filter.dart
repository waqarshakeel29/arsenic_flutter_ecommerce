import 'package:arsenic_flutter_ecommerce/controller/home/bloc.dart';
import 'package:arsenic_flutter_ecommerce/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class HorizontalListFilter extends StatefulWidget {
  final itemCount;
  final List<String> horizontalList;

  HorizontalListFilter(
      {Key? key, required this.itemCount, required this.horizontalList})
      : super(key: key);

  @override
  State<HorizontalListFilter> createState() => _HorizontalListFilterState();
}

class _HorizontalListFilterState extends State<HorizontalListFilter> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.itemCount,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                // context.read<HomeBloc>().add(FilterEvent(widget.horizontalList
                //     .where((element) => element.isSelcted)
                //     .map((e) => e.itemText)
                //     .toList()));
                context
                    .read<HomeBloc>()
                    .add(FilterEvent(widget.horizontalList[index]));
              },
              child: Container(
                  constraints: BoxConstraints(minWidth: 70),
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? kPrimaryColor
                        : kPrimaryLightColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      widget.horizontalList[index],
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ))),
            ),
          );
        });
  }
}
