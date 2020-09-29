import 'package:flutter/material.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class SourceCodePage extends StatefulWidget {
  final String sourceCodePath;

  SourceCodePage(this.sourceCodePath);

  @override
  _SourceCodePageState createState() => _SourceCodePageState();
}

class _SourceCodePageState extends State<SourceCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Source Code'),),
      body:  SourceCodeView(
        filePath: 'assets/source_code/${widget.sourceCodePath}.dart',
        codeLinkPrefix: 'https://github.com/<my_username>/<my_project>/blob/master/',
      ),
    );
  }
}
