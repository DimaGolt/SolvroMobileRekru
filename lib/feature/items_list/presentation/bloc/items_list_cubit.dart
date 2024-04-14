import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'items_list_state.dart';
part 'items_list_cubit.freezed.dart';

class ItemsListCubit extends Cubit<ItemsListState> {
  ItemsListCubit() : super(const ItemsListState.initial());
}
