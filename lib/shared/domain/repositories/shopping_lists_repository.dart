import 'package:solvro_mobile_rekru/shared/data/app_shopping_lists_repository.dart';
import 'package:solvro_mobile_rekru/shared/domain/entities/shop_item.dart';
import 'package:solvro_mobile_rekru/shared/domain/entities/shopping_list.dart';
import 'package:solvro_mobile_rekru/shared/domain/repositories/auth_repository.dart';

abstract class ShoppingListsRepository {
  Future<List<ShoppingList>> getLists();
  Future<ShoppingList> createList(ShoppingList list);
  Future<List<ShopItem>> getItems();

  factory ShoppingListsRepository.build(AuthRepository auth) => AppShoppingListsRepository(auth);
}