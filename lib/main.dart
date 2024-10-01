import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/Themes/theme.dart';
import 'package:todo_flutter/Themes/theme_provider.dart';
import 'package:todo_flutter/data/models/todo_model.dart';
import 'package:todo_flutter/pages/home_page.dart';
import 'package:todo_flutter/pages/settings_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoModelAdapter());

  await Hive.openBox<ToDoModel>('todo_box');
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).currentTheme,

      routes: {'/settings': (context) => SettingsPage()},
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
