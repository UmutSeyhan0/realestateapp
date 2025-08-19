import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(leading: Icon(Icons.settings), title: Text("Ayar 1")),
        ListTile(leading: Icon(Icons.info_outline), title: Text("Hakkında")),
      ],
    );
  }
}
