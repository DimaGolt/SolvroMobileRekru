// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingListImpl _$$ShoppingListImplFromJson(Map<String, dynamic> json) =>
    _$ShoppingListImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      emoji: json['emoji'] as String,
      color: const ColorConverter().fromJson(json['color'] as String),
      isActive: json['isActive'] as bool,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ShopItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ShoppingListImplToJson(_$ShoppingListImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'emoji': instance.emoji,
      'color': const ColorConverter().toJson(instance.color),
      'isActive': instance.isActive,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
