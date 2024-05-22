import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.text});

  final String text;
  static Color color = const Color(0xFF40B7AD);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 306,
      height: 54,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                
            ),
        ),
      )
      );
  }
}
