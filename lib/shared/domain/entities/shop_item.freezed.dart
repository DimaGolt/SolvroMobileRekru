// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShopItem _$ShopItemFromJson(Map<String, dynamic> json) {
  return _ShopItem.fromJson(json);
}

/// @nodoc
mixin _$ShopItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ItemCategory get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopItemCopyWith<ShopItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopItemCopyWith<$Res> {
  factory $ShopItemCopyWith(ShopItem value, $Res Function(ShopItem) then) =
      _$ShopItemCopyWithImpl<$Res, ShopItem>;
  @useResult
  $Res call({int id, String name, ItemCategory category});

  $ItemCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$ShopItemCopyWithImpl<$Res, $Val extends ShopItem>
    implements $ShopItemCopyWith<$Res> {
  _$ShopItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ItemCategory,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemCategoryCopyWith<$Res> get category {
    return $ItemCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShopItemImplCopyWith<$Res>
    implements $ShopItemCopyWith<$Res> {
  factory _$$ShopItemImplCopyWith(
          _$ShopItemImpl value, $Res Function(_$ShopItemImpl) then) =
      __$$ShopItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, ItemCategory category});

  @override
  $ItemCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$ShopItemImplCopyWithImpl<$Res>
    extends _$ShopItemCopyWithImpl<$Res, _$ShopItemImpl>
    implements _$$ShopItemImplCopyWith<$Res> {
  __$$ShopItemImplCopyWithImpl(
      _$ShopItemImpl _value, $Res Function(_$ShopItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
  }) {
    return _then(_$ShopItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ItemCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopItemImpl implements _ShopItem {
  _$ShopItemImpl(
      {required this.id, required this.name, required this.category});

  factory _$ShopItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final ItemCategory category;

  @override
  String toString() {
    return 'ShopItem(id: $id, name: $name, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopItemImplCopyWith<_$ShopItemImpl> get copyWith =>
      __$$ShopItemImplCopyWithImpl<_$ShopItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopItemImplToJson(
      this,
    );
  }
}

abstract class _ShopItem implements ShopItem {
  factory _ShopItem(
      {required final int id,
      required final String name,
      required final ItemCategory category}) = _$ShopItemImpl;

  factory _ShopItem.fromJson(Map<String, dynamic> json) =
      _$ShopItemImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  ItemCategory get category;
  @override
  @JsonKey(ignore: true)
  _$$ShopItemImplCopyWith<_$ShopItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
