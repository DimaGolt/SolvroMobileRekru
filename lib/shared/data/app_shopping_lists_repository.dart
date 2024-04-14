import 'package:solvro_mobile_rekru/shared/data/remote/remote_shopping_lists_repository.dart';
import 'package:solvro_mobile_rekru/shared/domain/entities/shop_item.dart';
import 'package:solvro_mobile_rekru/shared/domain/entities/shopping_list.dart';
import 'package:solvro_mobile_rekru/shared/domain/repositories/auth_repository.dart';
import 'package:solvro_mobile_rekru/shared/domain/repositories/shopping_lists_repository.dart';

class AppShoppingListsRepository implements ShoppingListsRepository {
  late final RemoteShoppingListsRepository _remote;
  final AuthRepository _auth;

  AppShoppingListsRepository(this._auth) {
    _remote = RemoteShoppingListsRepository(_auth);
  }

  @override
  Future<ShoppingList> createList(ShoppingList list) async {
    final result = await _remote.createList(list);
    return result;
  }

  @override
  Future<List<ShoppingList>> getLists() async {
    final result = await _remote.getLists();
    return result;
  }

  @override
  Future<List<ShopItem>> getItems() async {
    final result = await _remote.getItems();
    return result;
  }


}
