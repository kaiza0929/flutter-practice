import "package:flutter/material.dart";

class Header extends StatelessWidget with PreferredSizeWidget {

  @override 
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override 
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("メルカリ送料計算ツール")
    );
  }


}