
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_category.freezed.dart';

part 'item_category.g.dart';

@freezed
class ItemCategory with _$ItemCategory {
  factory ItemCategory({
    required int id,
    required String name,
    @Default(true) @JsonKey(includeToJson: false) bool show,
  }) = _ItemCategory;

  factory ItemCategory.fromJson(Map<String, dynamic> json) =>
      _$ItemCategoryFromJson(json);
}