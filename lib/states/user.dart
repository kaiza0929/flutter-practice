class User {

  bool status;
  String id;
  String name;

  User(this.status, this.id, this.name);

}

final User initUser = new User(false, "", "");

class UserState {

  final User user;
  UserState(this.user);

  static UserState initUserState() {
    return new UserState(initUser);
  }

}

class LoginAction {
  final User user;
  const LoginAction(this.user);
}

class LogoutAction {
  const LogoutAction();
}

UserState userReducer(UserState state, action) {
  
  if (action is LoginAction) {
    return new UserState(action.user);
  } else if (action is LogoutAction) {
    return new UserState(initUser);
  } else {
    return state;
  }

}