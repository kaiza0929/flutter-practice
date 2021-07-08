import "./user.dart";
import "./item.dart";

class AppState {

  UserState userState;
  ItemState itemState;

  AppState(this.userState, this.itemState);

  static AppState initAppState() {
    return new AppState(UserState.initUserState(), ItemState.initItemState());
  }

}

AppState appReducer(AppState state, action) {
  return AppState(userReducer(state.userState, action), itemReducer(state.itemState, action));
}