import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final bool hideBack;

  const BasicAppBar(
      {super.key, this.title, this.hideBack = false, this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? const Text(''),
      actions: [action ?? Container()],
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
