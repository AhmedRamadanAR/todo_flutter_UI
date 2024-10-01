import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/switch_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        elevation: 0,
      ),
      body:  SwitchState(),
    );
  }
}

