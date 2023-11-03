import 'package:flutter/material.dart';

import '../utlis/constants.dart';

class TextIconButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final IconData? icon;

  const TextIconButtonWidget(
      {super.key, required this.onPressed, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                child: Center(
                    child: Text(
              text.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: primaryColor),
            ))),
            icon != null ? Icon(icon) : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
