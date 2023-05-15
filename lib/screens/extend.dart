import 'package:flutter/material.dart';


class PracticalOfExtent extends StatefulWidget {
  const PracticalOfExtent({Key? key}) : super(key: key);

  @override
  State<PracticalOfExtent> createState() => _PracticalOfExtentState();
}

class _PracticalOfExtentState extends State<PracticalOfExtent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 100,
          cacheExtent: 30000,
          itemBuilder: (context,index){
            ////print('building $index');
        return    Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            width: 100,
          ),
        );
      }),
    );
  }
}
