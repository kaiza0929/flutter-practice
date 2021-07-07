import "./mindmap.dart";

class AppState {

  MindMapState mindMapState;

  AppState(this.mindMapState);

  static AppState initialState() {
    return AppState(new MindMapState(<Node>[
      new Node("@rootNode", "ウェブアプリケーション"),
      new Node("@sub", "サーバーサイドレンダリング")
    ]));
  }

}

AppState appReducer(AppState state, action) {
  return AppState(mindMapReduser(state.mindMapState, action));
}