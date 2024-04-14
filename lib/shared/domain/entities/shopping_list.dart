
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'shop_item.dart';

part 'shopping_list.freezed.dart';
part 'shopping_list.g.dart';

class ColorConverter implements JsonConverter<Color, String> {
  const ColorConverter();

  @override
  Color fromJson(String json) {
    try {
      return Color(int.parse(json));
    } catch (e) {
      throw const FormatException();
    }
  }

  @override
  String toJson(Color object) {
    return object.value.toString();
  }
}

@freezed
class ShoppingList with _$ShoppingList {
  @JsonSerializable(explicitToJson: true)
  factory ShoppingList({
    @JsonKey(includeToJson: false) required int id,
    required String name,
    required String emoji,
    @ColorConverter() required Color color,
    required bool isActive,
    @Default([]) List<ShopItem> items,
}) = _ShoppingList;

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);
}
