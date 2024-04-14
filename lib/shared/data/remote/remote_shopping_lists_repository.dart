import 'dart:convert';

import 'package:solvro_mobile_rekru/shared/domain/entities/shopping_list.dart';
import 'package:solvro_mobile_rekru/shared/domain/repositories/auth_repository.dart';
import 'package:solvro_mobile_rekru/shared/domain/repositories/shopping_lists_repository.dart';
import 'package:http/http.dart' as http;

class RemoteShoppingListsRepository implements ShoppingListsRepository{
  final AuthRepository _authRepository;

  RemoteShoppingListsRepository(this._authRepository);

  @override
  Future<ShoppingList> createList(ShoppingList list) async {
    final result = await http.post(
      Uri.parse('https://basket-buddy-solvro-api.kowalinski.dev/api/v1/shopping-lists/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token ${_authRepository.user!.token}'
      },
      body: list.toJson(),
    );
    if (result.statusCode == 200) {
      final createdList = ShoppingList.fromJson(jsonDecode(result.body));
      return createdList;
    } else {
      throw Exception('Failed to create shopping list: ${result.body}');
    }
  }

  @override
  Future<List<ShoppingList>> getLists() async {
    final result = await http.get(
      Uri.parse('https://basket-buddy-solvro-api.kowalinski.dev/api/v1/shopping-lists/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token ${_authRepository.user!.token}'
      },
    );
    if (result.statusCode == 200) {
      final List<dynamic> lists = jsonDecode(result.body);
      return lists.map((e) => ShoppingList.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch shopping list: ${result.body}');
    }
  }
}