import 'package:flutter/material.dart';

class ScreenWrapper extends StatelessWidget {
  final dynamic title;
  final double? toolbarHeight;
  final bool? automaticallyImplyLeading;
  final Widget? body;

  const ScreenWrapper({super.key, this.title, this.toolbarHeight, this.automaticallyImplyLeading, this.body});

  @override
  Widget build(BuildContext context) {
    final _titleWidget = title is Widget
        ? title
        : Text((title as String).toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: toolbarHeight,
        centerTitle: title is String,
        automaticallyImplyLeading: automaticallyImplyLeading ?? true,
        title: _titleWidget,
      ),
      body: body,
    );
  }
}
