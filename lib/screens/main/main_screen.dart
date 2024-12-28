import 'package:flutter/material.dart';
import '../view.dart';
import 'main_app_bar.dart';
import 'main_body.dart';
import 'main_float.dart';
import 'main_viewmodel.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<MainViewmodel>(
      onModelReady: (model) => model.fetchNotes(),
      builder: (context, model, child) => Scaffold(
        appBar: const MainAppBar(),
        body: MainBody(),
        floatingActionButton: const MainFloat(),
      ),
    );
  }
}