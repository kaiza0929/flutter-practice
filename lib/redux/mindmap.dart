class Node {

  String id;
  String keyword;

  Node(this.id, this.keyword);

}

class MindMapState {

  List<Node> nodes;

  MindMapState(this.nodes);

}

class AddNodeAction {
  final List<Node> newNodes;
  const AddNodeAction(this.newNodes);
}

class DeleteNodeAction {
  final String nodeId;
  const DeleteNodeAction(this.nodeId);
}

MindMapState mindMapReduser(MindMapState state, action) {
  /* stateインスタンスを新しく作って返すか、そのまま返すか。 */
  /* 受け取ったstateインスタンスを加工して返すのはダメ */
  if (action is AddNodeAction) {
    return new MindMapState(action.newNodes);
  } else if (action is DeleteNodeAction) {
    return new MindMapState(state.nodes.where((Node node) => node.id != action.nodeId).toList());
  } else {
    return state;
  }
}


/* ログイン状態を管理するならuser.dartなど */