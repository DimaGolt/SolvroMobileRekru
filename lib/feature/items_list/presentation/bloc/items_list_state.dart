part of 'items_list_cubit.dart';

@freezed
class ItemsListState with _$ItemsListState {
  const factory ItemsListState.initial() = _Initial;
  const factory ItemsListState.loading() = Loading;
  const factory ItemsListState.success(List<ShopItem> items, List<ItemCategory> categories) = Success;
  const factory ItemsListState.error(String message) = FetchError;
}
