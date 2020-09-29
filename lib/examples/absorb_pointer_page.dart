import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/examples/base_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AbsorbPointerExample extends BasePage {
  final String sourceCode;
  final String docUrl;
  final String title;

  AbsorbPointerExample({this.title, this.sourceCode, this.docUrl}) : super(
    title: title, sourceCode: sourceCode, docUrl: docUrl
  );

  @override
  _AbsorbPointerExampleState getState() => _AbsorbPointerExampleState();
}

class _AbsorbPointerExampleState extends BaseState<AbsorbPointerExample> {
  bool _absorbing = true;

  @override
  Widget buildBody() {
    return Column(
      children: [
        AbsorbPointer(
          absorbing: _absorbing,
          child: RaisedButton(
            child: Text('CLICK ME'),
            onPressed: () {
              Fluttertoast.showToast(msg: 'YOU CLICKED ME!');
            },
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Checkbox(
              value: _absorbing,
              onChanged: (value) {
                setState(() {
                  _absorbing = value;
                });
              },
            ),
            Text('Should Absorb'),
          ],
        )
      ],
    );
  }
}
