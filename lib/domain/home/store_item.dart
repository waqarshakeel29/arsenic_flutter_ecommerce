import 'package:equatable/equatable.dart';

class StoreItem extends Equatable {
  final String itemId;
  final String itemName;
  final double itemPrice;
  final double discount;

  const StoreItem({
    required this.itemId,
    required this.itemName,
    required this.itemPrice,
    this.discount = 0,
  });
  @override
  List<Object?> get props => [itemId];
}
