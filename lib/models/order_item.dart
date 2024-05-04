import 'package:decorly/models/furniture_item.dart';

class OrderItem {
  Map<String, Furniture> item;
  Map<String, int> itemPCS;
  DateTime date;
  int totalItem;
  double totalCost;

  OrderItem(
      {required this.item,
      required this.itemPCS,
      required this.date,
      required this.totalItem,
      required this.totalCost});
}
