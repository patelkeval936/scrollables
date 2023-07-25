import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'scroll view',
      home: const Page1(),
      theme: ThemeData.light(useMaterial3: false),
      themeMode: ThemeMode.light,
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
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NestedScrollViewWidget()));
              },
              child:const Text('hello world')),
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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: true,
            pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 100,
            toolbarHeight: 50,
            flexibleSpace : FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text('John Jason',style: TextStyle(fontSize: 15),),
              // titlePadding: EdgeInsets.only(left: 0,top: 5,bottom: 20),
            ),
          ),
          // SliverPersistentHeader(
          //     delegate: SliverPersistentHeaderDelegate()
          // ),


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
                        width: 50,
                      ),
                    ),
                    Column(
                      children: const [
                        Text('1'),
                        Text('Followers'),
                      ],
                    ),
                    Column(
                      children:const  [
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
                  padding:  EdgeInsets.only(left: 25, top: 4, bottom: 8),
                  child: Text('@anonymous'),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 500,
              color: Colors.grey,
              child: Center(child: Image.network('https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',

                width: 200,),),
            ),
          )
        ],
      ),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => throw UnimplementedError();

  @override
  // TODO: implement minExtent
  double get minExtent => throw UnimplementedError();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }

}

class NestedScrollViewWidget extends StatefulWidget {
  const NestedScrollViewWidget({Key? key}) : super(key: key);

  @override
  State<NestedScrollViewWidget> createState() => _NestedScrollViewWidgetState();
}

class _NestedScrollViewWidgetState extends State<NestedScrollViewWidget> {
  List<String> images = [
    'https://images.unsplash.com/photo-1682258480218-9ec54c988478?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8Ym84alFLVGFFMFl8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1682467880776-318800102106?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDV8Ym84alFLVGFFMFl8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1681663464356-64dde9d1da69?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDYwfGJvOGpRS1RhRTBZfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1682499099095-ceca24ee0979?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDR8Ym84alFLVGFFMFl8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1682413011369-e67691921c21?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDh8Ym84alFLVGFFMFl8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1682325373516-cffedbb35003?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDZ8Ym84alFLVGFFMFl8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1682270987919-bb751e0a0f89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDEyfGJvOGpRS1RhRTBZfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1682343160245-354923696ce6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE3fGJvOGpRS1RhRTBZfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1682099673497-b0f74a24d7ae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDIzfGJvOGpRS1RhRTBZfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1682078200240-0cda0e383a39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDI1fGJvOGpRS1RhRTBZfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1682057628665-9d0d51bae482?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM2fGJvOGpRS1RhRTBZfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1682009232730-8d396b933b39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDI5fGJvOGpRS1RhRTBZfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Delphine',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz_rounded,
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, isScroll) => [
            const SliverAppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              collapsedHeight: 210,
              toolbarHeight: 210,
              flexibleSpace: Center(
                child: InstagramProfileView(),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: MyDelegate(
                const TabBar(
                  indicatorColor: Colors.black,
                  indicatorWeight: 0.9,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.white,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.grid_on_sharp),
                    ),
                    Tab(
                      icon: Icon(Icons.video_library_outlined),
                    ),
                    Tab(
                      icon: Icon(Icons.person_pin_outlined),
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                padding: const EdgeInsets.all(2),
                children: List.generate(
                  images.length,
                      (index) => Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 2 / 3,
                padding: const EdgeInsets.all(2),
                children: List.generate(
                  images.length,
                      (index) => Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                padding: const EdgeInsets.all(2),
                children: List.generate(
                  images.length,
                      (index) => Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  MyDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class InstagramProfileView extends StatelessWidget {
  const InstagramProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 36,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: '2,632',
                  children: [
                    TextSpan(
                      text: '\nPosts',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: '829 k',
                  children: [
                    TextSpan(
                      text: '\nFollowers',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: '0',
                  children: [
                    TextSpan(
                      text: '\nFollowings',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: const TextSpan(
              text: 'Glenna Reichert',
              children: [
                TextSpan(
                  text: '\n📍 Bartholomebury',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    backgroundColor: const Color(0xff3897EF),
                    minimumSize: const Size(double.infinity, 30),
                    // padding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                  child: const Text('Follow'),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    backgroundColor: const Color(0xffEFEFEF),
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 30),
                    // padding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                  child: const Text('Message'),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    backgroundColor: const Color(0xffEFEFEF),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(0),
                  ),
                  icon: const Icon(
                    Icons.person_add_outlined,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
