import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_item.freezed.dart';

part 'shop_item.g.dart';

@freezed
class ShopItem with _$ShopItem {
  factory ShopItem({@Default('') String name}) = _ShopItem;

  factory ShopItem.fromJson(Map<String, dynamic> json) =>
      _$ShopItemFromJson(json);
}
