part of 'shopping_list_bloc.dart';

@freezed
class ShoppingListState with _$ShoppingListState {
  const factory ShoppingListState({
    @Default(false) bool isLoading,
    List<ShoppingList>? lists,
}) = _ShoppingListState;

  factory ShoppingListState.initial() {
    return const ShoppingListState();
  }
}
