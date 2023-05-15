import 'package:flutter/material.dart';

class Instagram extends StatefulWidget {
  const Instagram({Key? key}) : super(key: key);

  @override
  State<Instagram> createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> with TickerProviderStateMixin {

  late TabController controller;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();

    scrollController.addListener(() {
      setState(() {
        pixelsUnderAppBar = scrollController.position.pixels;
        opacity = pixelsUnderAppBar / 56 > 1 ? 1 : pixelsUnderAppBar / 56;
        print(pixelsUnderAppBar);
        if (pixelsUnderAppBar >= 169 && pixelsUnderAppBar <= 171) {
          scrollController.jumpTo(226);
        }
        if (pixelsUnderAppBar <= 225 && pixelsUnderAppBar > 222) {
          scrollController.jumpTo(168);
        }
      });
    });
  }

  double opacity = 0.0;
  double pixelsUnderAppBar = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          foregroundColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.black54.withOpacity(opacity),
          title: Text(
            'John Jason',
            style: TextStyle(color: Colors.white.withOpacity(opacity), fontWeight: FontWeight.w500, fontSize: 16),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_horiz_rounded),
            )
          ],
        ),
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 110,
                    child: Padding(
                      padding: EdgeInsets.only(top: 60, bottom: 20, left: 20),
                      child: Text(
                        'John Jason',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 115,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Anonymous.svg/1481px-Anonymous.svg.png',
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              children: const [
                                Text('1'),
                                Text('Followers'),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('1'),
                                Text('Following'),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('1'),
                                Text('Posts'),
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 25, top: 4, bottom: 16),
                          child: Text(
                            '@anonymous',
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                pixelsUnderAppBar >= 169
                    ? SliverPersistentHeader(
                  pinned: true,
                  delegate: BoxDelegate(pixelsUnderAppBar),
                )
                    : const SliverToBoxAdapter(),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: Delegate(
                    TabBar(
                      tabs: const [
                        Tab(
                          text: 'Peeks',
                        ),
                        Tab(
                          text: 'Posts',
                        ),
                        Tab(
                          text: 'List',
                        )
                      ],
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Colors.green,
                      // controller: controller,
                      labelColor: Colors.green,
                      // dividerColor: Colors.red,
                      overlayColor: MaterialStateProperty.all(Colors.grey),
                      unselectedLabelColor: Colors.white,
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 2,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                'https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                width: 100,
                              ),
                            ),
                            const Text('Peeks')
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: 2,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                'https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                width: 100,
                              ),
                            ),
                            const Text('Posts')
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: 2,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                'https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                width: 100,
                              ),
                            ),
                            const Text('Lists')
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class BoxDelegate extends SliverPersistentHeaderDelegate {
  double height;
  BoxDelegate(this.height);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const ColoredBox(
      color: Colors.transparent,
      child: SizedBox(
        height: 56,
        width: double.infinity,
      ),
    );
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  Delegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.black, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}