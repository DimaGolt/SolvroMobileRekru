import 'package:bloc_widgets/bloc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:solvro_mobile_rekru/feature/main/presentation/bloc/shopping_list_bloc.dart';

import '../../../../shared/domain/entities/shopping_list.dart';

class MainScreen
    extends BlocConsumerWidget<ShoppingListBloc, ShoppingListState> {
  const MainScreen({super.key});

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
                      return ListTile(
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
                            Text(
                              list.emoji,
                              style: const TextStyle(fontSize: 32),
                            ),
                          ],
                        ),
                        title: Text(list.name),
                      );
                    },
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
