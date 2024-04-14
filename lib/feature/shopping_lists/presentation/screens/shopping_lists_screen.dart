import 'package:bloc_widgets/bloc_widgets.dart';
import 'package:flutter/material.dart';

import '../../../../shared/domain/entities/shopping_list.dart';
import '../../../list/presentation/screens/list_screen.dart';
import '../bloc/shopping_list_bloc.dart';
import '../widgets/create_new_list_dialog.dart';

class ShoppingListsScreen
    extends BlocConsumerWidget<ShoppingListBloc, ShoppingListState> {
  const ShoppingListsScreen({super.key});

  @override
  void onMount(ShoppingListBloc bloc) {
    super.onMount(bloc);
    bloc.add(const ShoppingListEvent.load());
  }

  @override
  Widget buildWithState(context, bloc, state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My shopping lists'),
      ),
      body: Container(
        color: Colors.white,
        child: state.isLoading
            ? const Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(),
                ),
              )
            : state.lists?.isEmpty ?? true
                ? const Center(
                    child: Text('You have no shopping lists yet'),
                  )
                : ListView.separated(
                    itemCount: state.lists!.length,
                    itemBuilder: (_, index) {
                      ShoppingList list = state.lists![index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ListScreen(list: list)));
                        },
                        child: ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 15,
                                decoration:  BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: list.color,
                                ),
                              ),
                              Text(
                                list.emoji,
                                style: const TextStyle(fontSize: 32),
                              ),
                            ],
                          ),
                          title: Text(list.name),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(height: 1),
                  ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCreateNewListDialog(context).then((value) {
            if ((value as ShoppingList?) != null) {
              bloc.add(ShoppingListEvent.create(value!));
            }
          });
        },
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
