import "package:flutter/material.dart";
import "package:flutter_redux/flutter_redux.dart";
import "./../common/header.dart";
import "./../states/app.dart";
import "./../states/user.dart";
import "./../services/http.dart";

class LoginPage extends StatefulWidget {

  LoginPageState createState() => LoginPageState();

}

class LoginPageState extends State<LoginPage> {

  String email = "";
  String password = "";

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Header(),
      body: Container(width: 500, height: 300,  child: Card(child: Column(children: [
        Padding(padding: EdgeInsets.only(bottom: 30), child: TextFormField(decoration: InputDecoration(labelText: "メールアドレス"), onChanged: (String value) => setState(() { email = value; }))),
        Padding(padding: EdgeInsets.only(bottom: 30), child: TextFormField(decoration: InputDecoration(labelText: "パスワード"), obscureText: true, onChanged: (String value) => setState(() { password = value; }))),
        TextButton(onPressed: () async { 
          User user = await login(email, password); 
          StoreProvider.of<AppState>(context).dispatch(LoginAction(user));
          Navigator.of(context).pushNamed("/");
        }, child: Text("ログイン"))
      ])))
    );

  }

}