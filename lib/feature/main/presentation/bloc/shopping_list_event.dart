part of 'shopping_list_bloc.dart';

@freezed
class ShoppingListEvent with _$ShoppingListEvent {
  const factory ShoppingListEvent.load() = _Load;
  const factory ShoppingListEvent.create(ShoppingList list) = _Create;
}
