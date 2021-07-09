import "package:flutter/material.dart";

class Footer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "送料計算"),
      BottomNavigationBarItem(icon: Icon(Icons.add_location_outlined), label: "発送スポット検索")
    ]);
  }

}