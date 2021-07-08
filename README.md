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