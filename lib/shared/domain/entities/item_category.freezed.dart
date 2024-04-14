// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemCategory _$ItemCategoryFromJson(Map<String, dynamic> json) {
  return _ItemCategory.fromJson(json);
}

/// @nodoc
mixin _$ItemCategory {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  bool get show => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCategoryCopyWith<ItemCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCategoryCopyWith<$Res> {
  factory $ItemCategoryCopyWith(
          ItemCategory value, $Res Function(ItemCategory) then) =
      _$ItemCategoryCopyWithImpl<$Res, ItemCategory>;
  @useResult
  $Res call({int id, String name, @JsonKey(includeToJson: false) bool show});
}

/// @nodoc
class _$ItemCategoryCopyWithImpl<$Res, $Val extends ItemCategory>
    implements $ItemCategoryCopyWith<$Res> {
  _$ItemCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? show = null,
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
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemCategoryImplCopyWith<$Res>
    implements $ItemCategoryCopyWith<$Res> {
  factory _$$ItemCategoryImplCopyWith(
          _$ItemCategoryImpl value, $Res Function(_$ItemCategoryImpl) then) =
      __$$ItemCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, @JsonKey(includeToJson: false) bool show});
}

/// @nodoc
class __$$ItemCategoryImplCopyWithImpl<$Res>
    extends _$ItemCategoryCopyWithImpl<$Res, _$ItemCategoryImpl>
    implements _$$ItemCategoryImplCopyWith<$Res> {
  __$$ItemCategoryImplCopyWithImpl(
      _$ItemCategoryImpl _value, $Res Function(_$ItemCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? show = null,
  }) {
    return _then(_$ItemCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemCategoryImpl implements _ItemCategory {
  _$ItemCategoryImpl(
      {required this.id,
      required this.name,
      @JsonKey(includeToJson: false) this.show = true});

  factory _$ItemCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemCategoryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(includeToJson: false)
  final bool show;

  @override
  String toString() {
    return 'ItemCategory(id: $id, name: $name, show: $show)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.show, show) || other.show == show));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, show);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemCategoryImplCopyWith<_$ItemCategoryImpl> get copyWith =>
      __$$ItemCategoryImplCopyWithImpl<_$ItemCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemCategoryImplToJson(
      this,
    );
  }
}

abstract class _ItemCategory implements ItemCategory {
  factory _ItemCategory(
      {required final int id,
      required final String name,
      @JsonKey(includeToJson: false) final bool show}) = _$ItemCategoryImpl;

  factory _ItemCategory.fromJson(Map<String, dynamic> json) =
      _$ItemCategoryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(includeToJson: false)
  bool get show;
  @override
  @JsonKey(ignore: true)
  _$$ItemCategoryImplCopyWith<_$ItemCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
