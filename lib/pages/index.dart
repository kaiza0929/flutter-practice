import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import "./../common/header.dart";
//import "./../common/footer.dart";
import "./../redux/app.dart";
import "./../redux/mindmap.dart";

class Index extends StatefulWidget {

  IndexState createState() => IndexState();

}

class IndexState extends State<Index> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Column(children: [
        Text("マインドマップの作成"),
        StoreConnector<AppState, MindMapState>(
          converter: (store) => store.state.mindMapState,
          builder: (context, state) {
            return Column(children: [
              for (var node in state.nodes) 
                Column(
                  children: [
                    Text(node.keyword),
                    TextButton(onPressed: () { StoreProvider.of<AppState>(context).dispatch(DeleteNodeAction(node.id)); }, child: Text("キーワードを削除"))
                  ],
                )
            ]);
          }
        )
        //Footer()
      ],)
    );
  }

}