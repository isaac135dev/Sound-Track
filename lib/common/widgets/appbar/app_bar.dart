import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool hideBack;

  const BasicAppBar({
    super.key,
    this.title,
    this.hideBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? const Text(''),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
