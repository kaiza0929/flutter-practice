import "package:flutter/material.dart";
import "./../common/header.dart";
import "./../states/app.dart";
import "./../states/item.dart";
import "package:flutter_redux/flutter_redux.dart";

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(appBar: Header(), body: (Container(child: StoreConnector<AppState, ItemState>(
      converter: (store) => store.state.itemState,
      builder: (context, state) {
        return Container(child: Column(children: [
          Text("アイテム一覧"),
          Column(children: [
            for (var item in state.items) Text(item.name)
          ]),
          TextButton(child: Text("アイテムを追加"), onPressed: () { Navigator.of(context).pushNamed("/new"); })
        ]));
      }
    ))));

  }

}