import "./shipping.dart";

class AppState {

  ShippingState shippingState;
  AppState(this.shippingState);

  static AppState initAppState() {
    return new AppState(ShippingState.initShippingState());
  }

}

AppState appReducer(AppState state, action) {
  return AppState(shippingReducer(state.shippingState, action));
}