import 'package:flutter/material.dart';
import 'package:scrollables/screens/instagram.dart';

import 'extend.dart';
import 'file_vs_memory.dart';
import '../main.dart';
import 'art_and_culture.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'scroll view',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Instagram()));
            }, child:  Text('Instagram screen')),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ArtAndCulture()));
            }, child:  Text('Art And Culture')),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PracticalOfExtent()));
            }, child:  Text('cache extent')),

            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FileVsMemory()));
            }, child:  Text('File vs Memory image')),

            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AnimateToIndex()));
            }, child:  Text('Animate to index')),

          ],
        ),
      ),
    );
  }
}


