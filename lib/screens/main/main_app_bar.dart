import 'package:flutter/material.dart';

import '../view.dart';
import 'main_viewmodel.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: const Text('My Notes', style: TextStyle(color: Colors.white)),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundColor: Colors.blue.shade300,
            child: SelectorView<MainViewmodel, int>(
              selector: (_, vm) => vm.listCount!,
              builder: (_, __, count, ___) => Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}