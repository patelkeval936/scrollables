import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'scroll view',
      home: const Page1(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child:const  Padding(
            padding:  EdgeInsets.all(100),
            child: Text('hello world'),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.black54.withOpacity(opacity),
        leading: const Icon(Icons.arrow_back),
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
        notificationPredicate: (value) {
          setState(() {
            opacity = value.metrics.pixels / 100 > 1 ? 1 : value.metrics.pixels / 100;
          });
          return false;
        },
        // expandedHeight: 100,
        // toolbarHeight: 50,
        // flexibleSpace : FlexibleSpaceBar(
        //   collapseMode: CollapseMode.parallax,
        //   title: Text('John Jason',style: TextStyle(fontSize: 15),),
        //   titlePadding: EdgeInsets.only(left: 10,top: 5,bottom: 20),
        // ),
      ),
      body: DefaultTabController(
        length: 3,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 80, bottom: 20, left: 20),
                child: Text(
                  'John Jason',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            ),
            SliverToBoxAdapter(
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
                    padding:  EdgeInsets.only(left: 25, top: 4, bottom: 16),
                    child: Text(
                      '@anonymous',
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
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
                  controller: controller,
                  labelColor: Colors.green,
                  dividerColor: Colors.red,
                  overlayColor: MaterialStateProperty.all(Colors.grey),
                  unselectedLabelColor: Colors.white,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
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
                                const Text('hello')
                              ],
                            ),
                          ),
                        ),
                    childCount: 5),
            ),
          ],
        ),
      ),
    );
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
