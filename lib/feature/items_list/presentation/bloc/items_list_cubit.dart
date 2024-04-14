import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solvro_mobile_rekru/shared/domain/entities/item_category.dart';
import 'package:solvro_mobile_rekru/shared/domain/entities/shop_item.dart';
import 'package:solvro_mobile_rekru/shared/domain/repositories/shopping_lists_repository.dart';

part 'items_list_state.dart';

part 'items_list_cubit.freezed.dart';

class ItemsListCubit extends Cubit<ItemsListState> {
  final ShoppingListsRepository _listsRepository;
  List<ShopItem> _items = [];
  List<ShopItem> _itemsToShow = [];
  List<ItemCategory> _categories = [];
  final List<ShopItem> chosenItems = [];

  ItemsListCubit(this._listsRepository) : super(const ItemsListState.initial());

  void fetchItems() async {
    emit(const ItemsListState.loading());
    try {
      _items = await _listsRepository.getItems();
      _itemsToShow = _items;
      _categories = _items.map((e) => e.category).toSet().toList();
    } catch (e) {
      emit(ItemsListState.error(e.toString()));
      return;
    }
    emit(ItemsListState.success(_itemsToShow, _categories));
  }

  void updateCategories(List<ItemCategory> changedCategories) {
    emit(const ItemsListState.loading());
    _categories = changedCategories;
    _itemsToShow = _items
        .where((element) => _categories.contains(element.category))
        .toList();
    emit(ItemsListState.success(_itemsToShow, _categories));
  }

  void search(String text){
    emit(const ItemsListState.loading());
    _itemsToShow = _items
        .where((element) => _categories.contains(element.category))
        .toList();
    if(text != ''){
      _itemsToShow.removeWhere((element) => !element.name.contains(text));
    }
    emit(ItemsListState.success(_itemsToShow, _categories));
  }

  void pickItem(ShopItem item){
    emit(const ItemsListState.loading());
    chosenItems.add(item);
    _items.removeWhere((e) => e.id == item.id);
    _itemsToShow = _items
        .where((element) => _categories.contains(element.category))
        .toList();

    emit(ItemsListState.success(_itemsToShow, _categories));
  }

  void reset() {
    _items = [];
    _itemsToShow = [];
    _categories = [];
    chosenItems.removeWhere((element) => true);
    emit(const ItemsListState.initial());
  }
}
