import 'package:bloc_widgets/bloc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:solvro_mobile_rekru/feature/items_list/presentation/bloc/items_list_cubit.dart';
import 'package:solvro_mobile_rekru/shared/domain/entities/item_category.dart';
import 'package:solvro_mobile_rekru/shared/domain/entities/shop_item.dart';

class ItemsListScreen
    extends BlocConsumerWidget<ItemsListCubit, ItemsListState> {
  ItemsListScreen({super.key});

  bool isLoading = true;
  List<ShopItem> items = [];
  List<ItemCategory> categories = [];

  @override
  void onMount(ItemsListCubit bloc) {
    bloc.fetchItems();
    super.onMount(bloc);
  }

  @override
  void listener(
      BuildContext context, ItemsListCubit bloc, ItemsListState state) {
    state.maybeMap(
      error: (state) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
      },
      success: (state) {
        isLoading = false;
        items = state.items;
        categories = items.map((e) => e.category).toSet().toList();
      },
      orElse: () {},
    );
  }

  @override
  Widget buildWithState(context, bloc, state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: Container(
        color: Colors.white,
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: CircularProgressIndicator(),
                ),
              )
            : _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        Wrap(
          spacing: 4,
          children: categories
              .map(
                (e) => FilterChip(
                  selected: e.show,
                  label: Text(
                    e.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  onSelected: (show) {},
                ),
              )
              .toList(),
        ),
        const Divider(thickness: 2),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Category: ${item.category.name}'),
                );
              },
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemCount: items.length),
        ),
      ],
    );
  }
}
