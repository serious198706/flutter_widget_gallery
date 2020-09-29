import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_gallery/examples/absorb_pointer_page.dart';
import 'package:flutter_widget_gallery/model/widget_item.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<WidgetItem> _items;

  @override
  void initState() {
    super.initState();
    _items = List();
    _parseAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget Gallery'),
      ),
    );
  }

  void _parseAsset() async {
    String result = await DefaultAssetBundle.of(context).loadString('assets/widgets.json');
    List<dynamic> jsonList = jsonDecode(result);
    List<WidgetItem> items = jsonList.map((e) => WidgetItem.fromJson(e)).toList();

    setState(() {
      _items = items;
    });
  }

  void go() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return AbsorbPointerExample(
        title: 'AbsorbPointer',
        sourceCode: 'absorb_pointer_page',
        docUrl: '456',
      );
    }));
  }
}
