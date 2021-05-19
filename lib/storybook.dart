import 'package:flutter/material.dart';
import 'package:dashbook/dashbook.dart';

class Storybook extends StatelessWidget {
  const Storybook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashbook = Dashbook();

    dashbook.storiesOf('Text').decorator(CenterDecorator()).add(
          'default',
          (ctx) => Container(
            width: 300,
            child: Text(
              ctx.textProperty("text", "Text Example"),
              textAlign: ctx.listProperty(
                "text align",
                TextAlign.center,
                TextAlign.values,
              ),
              textDirection: ctx.listProperty(
                "text direction",
                TextDirection.rtl,
                TextDirection.values,
              ),
              style: TextStyle(
                fontSize: ctx.numberProperty("font size", 20),
                fontWeight: ctx.listProperty(
                  "font weight",
                  FontWeight.normal,
                  FontWeight.values,
                ),
                fontStyle: ctx.listProperty(
                  "font style",
                  FontStyle.normal,
                  FontStyle.values,
                ),
              ),
            ),
          ),
        );

    dashbook.storiesOf('RaisedButton').decorator(CenterDecorator()).add(
          'default',
          (ctx) => ElevatedButton(
            child: Text('Ok'),
            onPressed: () {},
          ),
        );

    return Container(child: dashbook);
  }
}
