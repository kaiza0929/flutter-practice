WidgetはFlutterアプリの画面の構成要素のこと(ボタン、カードなどのUI要素全て)<br>
vscodeのrun -> Start Debuggingで実行<br>
flutter runでも立ち上がるがホットリロードが効かなくなる<br><br>
Dartの関数 => 戻り値の型 関数名() => 処理<br>
```
MyPageState createState() => MyPageState();
```
描画関数を持つのはステートクラスのほうである<br><br>
クラスの書き方<br>
```
class Node {

    /* メンバ */
    String keyword;

    /* コンストラクタ */
    Node(this.keyword);

}

/* インスタンスの作成 */
Node()
```

finalは再代入不可(つまり定数) constとは評価(?)のタイミングが異なる<br><br>
非同期関数 FutureはJSのPromiseのようなもの<br>
```
Future<String> getText() async {
  return "あああああ";
}
```

ウィジェットのchildrenの中でfor文を使う場合は{}が不要<br>
```
for (var value in ["NormalMail", "RMercari", "YMercari"]) Radio(value: value, groupValue: "shipping", onChanged: (e) => { print(e) }),
```
インターフェースは存在しない。抽象クラスならある。<br>
```
abstract class ShippingCalculator {
  int calc(double longSide, double shortSide, double thickness, double weight);
}

class RMercariShippingCalculator  extends ShippingCalculator {

  @override
  int calc(double longSide, double shortSide, double thickness, double weight) {
    return 0;
  }

}
```