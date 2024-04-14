import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solvro_mobile_rekru/shared/domain/entities/item_category.dart';

part 'shop_item.freezed.dart';

part 'shop_item.g.dart';

@freezed
class ShopItem with _$ShopItem {
  factory ShopItem({
    required int id,
    required String name,
    required ItemCategory category,
  }) = _ShopItem;

  factory ShopItem.fromJson(Map<String, dynamic> json) =>
      _$ShopItemFromJson(json);
}
