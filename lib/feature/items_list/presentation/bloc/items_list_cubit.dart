import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solvro_mobile_rekru/shared/domain/entities/shop_item.dart';
import 'package:solvro_mobile_rekru/shared/domain/repositories/shopping_lists_repository.dart';

part 'items_list_state.dart';

part 'items_list_cubit.freezed.dart';

class ItemsListCubit extends Cubit<ItemsListState> {
  final ShoppingListsRepository _listsRepository;

  ItemsListCubit(this._listsRepository) : super(const ItemsListState.initial());

  void fetchItems() async {
    emit(const ItemsListState.loading());
    List<ShopItem> items = [];
    try {
      items = await _listsRepository.getItems();
    } catch (e) {
      emit(ItemsListState.error(e.toString()));
      return;
    }
    emit(ItemsListState.success(items));
  }
}
