import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/source_code_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class BasePage extends StatefulWidget {
  final String sourceCode;
  final String docUrl;
  final String title;

  BasePage({this.title, this.sourceCode, this.docUrl});

  @override
  State<StatefulWidget> createState() => getState();

  BaseState getState();
}

abstract class BaseState<T extends BasePage> extends State<T> {

  Widget buildBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.code),
            onPressed: goToSourceCodePage,
          ),
          IconButton(
            icon: Icon(Icons.description),
            onPressed: goToSourceCodePage,
          )
        ],
      ),
      body: buildBody(),
    );
  }

  ///
  /// go to a page that shows the example code
  void goToSourceCodePage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) {
        return SourceCodePage(widget.sourceCode);
      }
    ));
  }

  ///
  /// go to a page that shows the official document with [docUrl]
  void goToDocPage() {
    Fluttertoast.showToast(msg: widget.docUrl);
  }
}
