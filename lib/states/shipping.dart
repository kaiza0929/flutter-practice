class Shipping {
  String name;
  String type;
  int fee;
  Shipping(this.name, this.type, this.fee);
}

class ShippingState {

  final Shipping shipping;
  ShippingState(this.shipping);

  static ShippingState initShippingState() {
    return new ShippingState(new Shipping("", "", -1));
  }

}

class SetShippingAction {
  final Shipping shipping;
  const SetShippingAction(this.shipping);
}

ShippingState shippingReducer(ShippingState state, action) {

  if (action is SetShippingAction) {
    return new ShippingState(action.shipping);
  } else {
    return state;
  }

}