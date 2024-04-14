part of 'shopping_list_bloc.dart';

@freezed
class ShoppingListEvent with _$ShoppingListEvent {
  const factory ShoppingListEvent.started() = _Started;
}
