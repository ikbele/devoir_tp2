import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';

void main() {
  runApp(const AtlasGeoApp());
}

class AtlasGeoApp extends StatelessWidget {
  const AtlasGeoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atlas Géographique',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WelcomePage(),
    );
  }
}
