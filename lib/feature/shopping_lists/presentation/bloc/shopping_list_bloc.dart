import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/domain/entities/shopping_list.dart';
import '../../../../shared/domain/repositories/shopping_lists_repository.dart';

part 'shopping_list_event.dart';

part 'shopping_list_state.dart';

part 'shopping_list_bloc.freezed.dart';

class ShoppingListBloc extends Bloc<ShoppingListEvent, ShoppingListState> {
  final ShoppingListsRepository _listsRepository;

  ShoppingListBloc(this._listsRepository) : super(ShoppingListState.initial()) {
    on<ShoppingListEvent>((event, emit) async {
      await event.map(
        load: (_)  =>  _loadLists(emit),
        create: (event)  =>  _createList(event.list, emit),
      );
    });
  }

  _loadLists(Emitter<ShoppingListState> emit) async {
    emit(state.copyWith(isLoading: true));
    final lists = await _listsRepository.getLists();
    emit(state.copyWith(lists: lists, isLoading: false));
  }

  _createList(ShoppingList list, Emitter<ShoppingListState> emit) async {
    emit(state.copyWith(isLoading: true));
    await _listsRepository.createList(list);
    _loadLists(emit);
  }
}
