class Shipping {
  String name;
  Shipping(this.name);
}

class ShippingState {

  final Shipping shiiping;
  ShippingState(this.shiiping);

  static ShippingState initShippingState() {
    return new ShippingState(new Shipping("普通郵便"));
  }

}

class SetShippingAction {
  final String name;
  const SetShippingAction(this.name);
}

ShippingState shippingReducer(ShippingState state, action) {

  if (action is SetShippingAction) {
    return new ShippingState(new Shipping(action.name));
  } else {
    return state;
  }

}