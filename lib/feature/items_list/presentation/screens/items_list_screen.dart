import 'package:bloc_widgets/bloc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:solvro_mobile_rekru/feature/items_list/presentation/bloc/items_list_cubit.dart';

class ItemsListScreen extends BlocConsumerWidget<ItemsListCubit, ItemsListState> {
  const ItemsListScreen({super.key});

  @override
  Widget buildWithState( context,  bloc,  state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Text('items'),
        ),
      ),
    );
  }
}
