import "package:flutter/material.dart";

class Footer extends StatefulWidget {

  @override
  FooterState createState() => FooterState();

}

class FooterState extends State<Footer> {

  String keyword = "";

  @override 
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
        child: Column(children: [
          TextFormField(),
          TextButton(onPressed: () { setState(() { keyword = "ああああ"; } ); }, child: Text("キーワードを追加"))
        ])
      )
    );

  }

}