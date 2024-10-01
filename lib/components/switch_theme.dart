
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/Themes/theme_provider.dart';

class SwitchState extends StatelessWidget {
  //const SwitchState({super.key});
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(color:Colors.white.withOpacity(0.1),borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row( // Changed to Column to fit the layout better
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                themeProvider.isDarkMode ? 'Dark Mode' : 'Light Mode',
                style: const TextStyle(fontSize: 24),
              ),
              const Spacer(),
              Switch(
                value: themeProvider.isDarkMode,
                onChanged: (newValue) {
               themeProvider.changeSwitchState();
                },
                activeColor: Colors.green,
                activeTrackColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    )
    ;
  }
}