import 'package:flutter/material.dart';
import 'package:grumetsearch/view/SerachRangePage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // packageをインポート

//APIアクセスキーが入った.envファイルの読み込み
Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

// .env に記述したアクセストークンを取得
final String? token = dotenv.env['Hotpapper_API_KEY'];


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SearchRangePage(),
    );
  }
}
