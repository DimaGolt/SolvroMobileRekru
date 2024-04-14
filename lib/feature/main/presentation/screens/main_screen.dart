import 'package:bloc_widgets/bloc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:solvro_mobile_rekru/feature/main/presentation/bloc/shopping_list_bloc.dart';

class MainScreen
    extends BlocConsumerWidget<ShoppingListBloc, ShoppingListState> {
  const MainScreen({super.key});

  @override
  Widget buildWithState(context, bloc, state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My shopping lists'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (_, index) => ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                const Text(
                  '🐞',
                  style: TextStyle(fontSize: 32),
                ),
              ],
            ),
            title: Text('List $index'),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(height: 1),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Row(
          children: [
            Icon(
              Icons.add,
              color: Colors.white,
            ),
            Text(
              'Create new',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
