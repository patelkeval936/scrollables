import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';


class FileVsMemory extends StatefulWidget {
  const FileVsMemory({Key? key}) : super(key: key);
  @override
  State<FileVsMemory> createState() => _FileVsMemoryState();
}

String? path;

class _FileVsMemoryState extends State<FileVsMemory> {

  void saveAsFile(){
    Uri uri = Uri.parse('https://svs.gsfc.nasa.gov/vis/a030000/a030800/a030877/frames/5760x3240_16x9_01p/BlackMarble_2016_928m_india_labeled.png');

    http.get(uri).then((value) async {
     Directory? dir = await getTemporaryDirectory();

     File file = File('${dir.path}/abc.png');
     path = '${dir.path}/abc.png';
     file.writeAsBytesSync(value.bodyBytes);
    });
  }



  getFilePath()async{
    Directory? dir = await getTemporaryDirectory();
    path = '${dir.path}/abc.png';
  }

  @override
  void initState() {
    getFilePath();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Column(
          children: [
            ElevatedButton(onPressed: (){
              saveAsFile();
            }, child: const Text('press me')),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CreateFileImages()));
            }, child: const Text('go to file images')),
          ],
        )),
        ),
      );
  }
}


class CreateFileImages extends StatefulWidget {
  const CreateFileImages({Key? key}) : super(key: key);

  @override
  State<CreateFileImages> createState() => _CreateFileImagesState();
}

class _CreateFileImagesState extends State<CreateFileImages> {

  ScrollController controller = ScrollController();

  Uint8List? image;

  void saveAsFile(){
    Uri uri = Uri.parse('https://svs.gsfc.nasa.gov/vis/a030000/a030800/a030877/frames/5760x3240_16x9_01p/BlackMarble_2016_928m_india_labeled.png');

    http.get(uri).then((value) async {
      Directory? dir = await getTemporaryDirectory();
      File file = File('${dir.path}/abc.png');
      path = '${dir.path}/abc.png';
      file.writeAsBytesSync(value.bodyBytes);
      getFilePath();
    });
  }

  getFilePath()async{
    Directory? dir = await getTemporaryDirectory();
    path = '${dir.path}/abc.png';
    File file = File(path!);
    setState(() {
      image = file.readAsBytesSync();
    });
  }

  @override
  void initState() {
    saveAsFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: (){
                controller.animateTo(controller.position.minScrollExtent, duration: const Duration(seconds: 5), curve: Curves.linear);
              },
              child: const Icon(Icons.arrow_circle_up_outlined),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: (){
                controller.animateTo(controller.position.maxScrollExtent, duration:const  Duration(seconds: 5), curve: Curves.linear);
              },
              child: const  Icon(Icons.arrow_drop_down_circle_outlined),
            ),
          ),
        ],
      ),
      ///file image
      body: image == null ? const Center(child: CircularProgressIndicator(),): ListView.builder(
          itemCount: 10000,
          controller: controller,
          itemBuilder: (context,index){
            //print('building ${index+1}');
        return Image.file(File(path!),key: UniqueKey(),);
      }),
      ///memory image
      // body: ListView.builder(
      //     itemCount: 5000,
      //     cacheExtent: 100,
      //     controller: controller,
      //     itemBuilder: (context,index){
      //       //print('building ${index+1}');
      //   return Image.memory(image!,key: ValueKey(index.toString()),);
      // }),
    );
  }
}
