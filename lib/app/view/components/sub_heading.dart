import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  const SubHeading(this.text, {super.key, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: color),
    );
  }
}
