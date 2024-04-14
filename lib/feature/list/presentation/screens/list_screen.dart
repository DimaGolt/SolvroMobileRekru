import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_mobile_rekru/feature/items_list/presentation/bloc/items_list_cubit.dart';
import 'package:solvro_mobile_rekru/feature/items_list/presentation/screens/items_list_screen.dart';
import 'package:solvro_mobile_rekru/shared/domain/entities/shopping_list.dart';

class ListScreen extends StatelessWidget {
  final ShoppingList list;

  const ListScreen({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: list.color,
        title: Text(list.name),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Text('items'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: list.color,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => ItemsListScreen())).then((_) {});
        },
        label: const Row(
          children: [
            Icon(
              Icons.add,
              color: Colors.white,
            ),
            Text(
              'Add items',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
