import "package:flutter/material.dart";
import "package:flutter_redux/flutter_redux.dart";
import "./../common/header.dart";
import "./../states/app.dart";
import "./../states/shipping.dart";
import "./../services/calc.dart";

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  double longSide = 0.0;
  double shortSide = 0.0;
  double thickness = 0.0;
  double weight = 0.0;

  /* ラジオの初期選択値 */
  String selectedRadioValue = "普通郵便";

  final _formKey = GlobalKey<FormState>();

  String? checkNumberFormat(String? value) {

    if (value == null || value.isEmpty) {
      return "未入力です";
    } else {
      try {
        print(double.parse(value));
      } catch (error) {
        print(error);
        return "入力形式が不正です";
      }
    }

  }

  @override 
  Widget build(BuildContext context) {

    return Scaffold(appBar: Header(), body: StoreConnector<AppState, ShippingState>(
      converter: (store) => store.state.shippingState,
      builder: (context, state) {
        return Container(child: Column(children: [
          Form(key: _formKey, child: Column(children: [
            Padding(padding: EdgeInsets.only(bottom: 30), child: Row(children: [
              for (var value in ["普通郵便", "らくらくメルカリ便", "ゆうゆうメルカリ便"]) 
                /* valueとgroupValueが一致するラジオボタンが選択済みになる */
                Expanded(child: RadioListTile(title: Text(value), activeColor: Colors.blue, value: value, groupValue: selectedRadioValue, onChanged: (e) { setState(() { selectedRadioValue = e as String; }); })),
            ])),
            /* value as doubleだとエラー */
            Padding(padding: EdgeInsets.only(bottom: 30), child: TextFormField(decoration: InputDecoration(labelText: "長辺(cm)"), validator: (value) => checkNumberFormat(value), onSaved: (value) => { setState(() { longSide = double.parse(value as String); }) },)),
            Padding(padding: EdgeInsets.only(bottom: 30), child: TextFormField(decoration: InputDecoration(labelText: "短辺(cm)"), validator: (value) => checkNumberFormat(value), onSaved: (value) => { setState(() { shortSide =  double.parse(value as String); }) },)),
            Padding(padding: EdgeInsets.only(bottom: 30), child: TextFormField(decoration: InputDecoration(labelText: "厚さ(cm)"), validator: (value) => checkNumberFormat(value), onSaved: (value) => { setState(() { thickness =  double.parse(value as String); }) },)),
            Padding(padding: EdgeInsets.only(bottom: 30), child: TextFormField(decoration: InputDecoration(labelText: "重さ(g)"), validator: (value) => checkNumberFormat(value), onSaved: (value) => { setState(() { weight = double.parse(value as String); }) },)),
            ElevatedButton(child: Text("送料を算出"), style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white), onPressed: () {
              if ((_formKey.currentState as FormState).validate()) {
                (_formKey.currentState as FormState).save();
                StoreProvider.of<AppState>(context).dispatch(SetShippingAction(callCalculateFunction(selectedRadioValue, longSide, shortSide, thickness, weight)));
              }
            }),
          ])),
          if (state.shipping.fee != -1)
            Column(children: [
              Text(state.shipping.name),
              Text(state.shipping.type),
              Text(state.shipping.fee.toString())
          ])
        ]));
      }
    ));

  }
  

}