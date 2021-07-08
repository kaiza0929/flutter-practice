import "package:flutter/material.dart";
import "./../common/header.dart";
import "./../states/app.dart";
import "./../states/user.dart";
import "./../states/item.dart";
import "package:flutter_redux/flutter_redux.dart";

class NewPage extends StatefulWidget {
  NewPageState createState() => NewPageState();
}

class NewPageState extends State<NewPage> {

  String name = "";
  String place = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: Header(), body: StoreConnector<AppState, UserState>(
      converter: (store) => store.state.userState,
      builder: (context, state) {
        return Form(key: _formKey, child: Column(children: [
          Padding(padding: EdgeInsets.only(bottom: 30), child: TextFormField(decoration: InputDecoration(labelText: "アイテム名"), validator: (value) => value == null || value.isEmpty ? "アイテム名が未入力です" : null, onSaved: (value) { setState(() { name = value as String; }); })),
          Padding(padding: EdgeInsets.only(bottom: 30), child: TextFormField(decoration: InputDecoration(labelText: "保存先"), validator: (value) => value == null || value.isEmpty ? "保存先が未入力です" : null, onSaved: (value) { setState(() { place = value as String; }); })),
          TextButton(child: Text("アイテムを追加"), onPressed: () {
            if ((_formKey.currentState as FormState).validate()) {
              /* 各テキストフォームのonSaved関数を実行(入力をステートに追加) */
              (_formKey.currentState as FormState).save();
              StoreProvider.of<AppState>(context).dispatch(AddItemAction(new Item("", state.user.id, this.name, this.place)));
            }}),
          TextButton(child: Text("アイテム一覧に戻る"), onPressed: () { Navigator.of(context).pushNamed("/"); },)
        ]));
      }
    ));
  
  }

}