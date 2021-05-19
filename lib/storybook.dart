import 'package:dashbook/dashbook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_stars/star.dart';
import 'package:flutter_animated_stars/stars_coming_from_center.dart';

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

    dashbook.storiesOf('Star').decorator(CenterDecorator()).add(
          'default',
          (ctx) => DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 200,
                minWidth: 200,
                maxWidth: 200,
                maxHeight: 200,
              ),
              child: Star(),
            ),
          ),
        );

    dashbook
        .storiesOf('StarsComingFromCenter')
        .decorator(CenterDecorator())
        .add('default', (ctx) => StarsComingFromCenter());

    return Container(child: dashbook);
  }
}
