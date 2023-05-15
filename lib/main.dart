import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimateToIndex(),
    );
  }
}

class AnimateToIndex extends StatefulWidget {
  const AnimateToIndex({Key? key}) : super(key: key);
  @override
  State<AnimateToIndex> createState() => _AnimateToIndexState();
}

class _AnimateToIndexState extends State<AnimateToIndex> {

  int goto = 10;

  Map<int, double> sizes = {};

  ScrollController controller = ScrollController();
  ScrollPosition? position;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: 40,
          controller: controller,
          // cacheExtent: 0,
          // physics: PageScrollPhysics(),
          addAutomaticKeepAlives: true,
          itemBuilder: (context, index) {
            //print('building ${index + 1}');
            return Builder(builder: (itemContext) {
              // sizes[index] = context.findRenderObject().

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                // //print(MediaQuery.of(itemContext).size.height);
                //print(itemContext.size?.height);
                if (index > 0) {
                  sizes[index] = sizes[index - 1]! + (itemContext.size == null ? 0.0 : itemContext.size!.height);
                } else {
                  sizes[index] = 0;
                }
                //print(sizes);
              });

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    controller.animateTo(sizes[index + 10]!, duration: const Duration(seconds: 1), curve: Curves.linear);
                    //print(sizes);
//                controller.animateTo(120 * goto.toDouble(),duration: Duration(seconds: 1),curve: Curves.linear);
                    // controller.animateTo(controller.position.maxScrollExtent, duration: Duration(seconds:12), curve: Curves.decelerate);
                  },
                  child: Container(
                    color: index % 2 == 0 ? Colors.red : Colors.green,
                    height: index % 2 == 0 ? 80 : 50,
                    child: Center(
                      child: Text((index + 1).toString()),
                    ),
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
