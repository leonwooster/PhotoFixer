import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/scratch_removal/views/scratch_removal_page.dart';

void main() {
  runApp(const ProviderScope(child: PhotoFixerApp()));
}

class PhotoFixerApp extends StatelessWidget {
  const PhotoFixerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhotoFixer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ScratchRemovalPage(),
    );
  }
}
