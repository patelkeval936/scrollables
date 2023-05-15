import 'package:flutter/material.dart';


class ArtAndCulture extends StatefulWidget {
  const ArtAndCulture({Key? key}) : super(key: key);

  @override
  State<ArtAndCulture> createState() => _ArtAndCultureState();
}

class _ArtAndCultureState extends State<ArtAndCulture> {
  double opacity = 0.0;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      print(controller.position.pixels);
      setState(() {
        opacity = controller.position.pixels / 40 > 1 ? 1 : 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          foregroundColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.black54.withOpacity(opacity),
          leading:  IconButton(onPressed : (){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back),),
          title: Row(
            children: [
              opacity >= 1
                  ? Image.network(
                      'https://docs-assets.developer.apple.com/published/57b52f94a38308a4360b935fd9b4575b/app-icon-realistic-materials@2x.png',
                      height: 30,
                    )
                  : Container(),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Art & Culture',
                style: TextStyle(color: Colors.white.withOpacity(opacity), fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_horiz_rounded),
            )
          ],
        ),
        body: NestedScrollView(
          controller: controller,
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                            'https://docs-assets.developer.apple.com/published/57b52f94a38308a4360b935fd9b4575b/app-icon-realistic-materials@2x.png',
                            width: 100),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Art & Culture',
                              style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                            const Text(
                              '37 Follower',
                              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
                            ),
                            const Text(
                              '9 Posts',
                              style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w400),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                ///TODO: implement this method
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.green.shade200,
                                  ),
                                  foregroundColor: MaterialStateProperty.all(Colors.black)),
                              child: const Text(
                                'Follow space',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: Delegate(),
                  pinned: true,
                ),
              ];
            },
            body: RefreshIndicator(
              color: Colors.green,
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 2));
              },
              child: ListView.builder(
                itemCount: 10,
                  // physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Image.network(
                                  'https://docs-assets.developer.apple.com/published/57b52f94a38308a4360b935fd9b4575b/app-icon-realistic-materials@2x.png',
                                  width: 60),
                              const Padding(
                                padding:  EdgeInsets.all(8.0),
                                child: Text('hello'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )),
      ),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 5),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  Padding(
              padding: EdgeInsets.only(left: index == 0 ? 16 : 4,right: 4,top: 4,bottom: 4),
              child: const Chip(label: Text('Topic Name')),
            );
          }),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 60;

  @override
  // TODO: implement minExtent
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}
