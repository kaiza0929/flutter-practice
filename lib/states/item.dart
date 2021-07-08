class Item {

  String itemId;
  String ownerId;
  String name;
  String place;

  Item(this.itemId, this.ownerId, this.name, this.place);

}

class ItemState {

  final List<Item> items;
  ItemState(this.items);

  static initItemState() {
    return new ItemState([]);
  }

}

class AddItemAction {
  final Item item;
  const AddItemAction(this.item);
}

class AddItemsAction {
  final List<Item> items;
  const AddItemsAction(this.items);
}

class DeleteItemAction {
  final String itemId;
  const DeleteItemAction(this.itemId);
}

ItemState itemReducer(ItemState state, action) {

  if (action is AddItemAction) {
    List<Item> items = state.items;
    items.add(action.item);
    return new ItemState(items);
  } else if (action is AddItemsAction) {
    return new ItemState(state.items + action.items);
  } else if (action is DeleteItemAction) {
    return new ItemState(state.items.where((Item item) => item.itemId != action.itemId).toList());
  } else {
    return state;
  }

}