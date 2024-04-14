import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_list_event.dart';
part 'shopping_list_state.dart';
part 'shopping_list_bloc.freezed.dart';

class ShoppingListBloc extends Bloc<ShoppingListEvent, ShoppingListState> {
  ShoppingListBloc() : super(const ShoppingListState.initial()) {
    on<ShoppingListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
