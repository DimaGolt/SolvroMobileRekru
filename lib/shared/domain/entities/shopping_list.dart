
import 'package:freezed_annotation/freezed_annotation.dart';

import 'shop_item.dart';

part 'shopping_list.freezed.dart';
part 'shopping_list.g.dart';

@freezed
class ShoppingList with _$ShoppingList {
  factory ShoppingList({
    required int id,
    required String name,
    required String emoji,
    required bool isActive,
    @Default([]) List<ShopItem> items,
}) = _ShoppingList;

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);
}
