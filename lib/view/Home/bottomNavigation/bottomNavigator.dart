

import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';
import 'package:newzfeedz/view/Home/homeScreen.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final colorsPath = [Colors.red, Colors.orangeAccent, Colors.orange, Colors.red];

  int index = 0;
  final List<Widget> _pages = [
    HomeScreen()
  ];

  // Create scroll controller that will be given to scrollable widget and hidable.
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// We've wrapped [AppBar] with [Hidable].
      /// So, now, our [AppBar] supports scroll to hide feature.
     

      /// Scrollable widget of main widget
      body: _pages[index],

      /// We've wrapped [BottomNavigationBar] with [Hidable].
      /// So, now, our [BottomNavigationBar] supports scroll to hide feature.
      bottomNavigationBar: Hidable(
        controller: scrollController,
        enableOpacityAnimation: true, // As default it's true
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          
          currentIndex: index,
          onTap: (i) => setState(() => index = i),
          items: bottomBarItems(),
        ),
      ),

      /// We've wrapped [FloatingActionButton] with [Hidable].
      /// So, now, our [FloatingActionButton] supports scroll to hide feature.
     
    );
  }

  List<BottomNavigationBarItem> bottomBarItems() {
    return [
      BottomNavigationBarItem(
        label: 'Feed',
        icon: const Icon(Icons.feed_outlined, color: Colors.white),
        backgroundColor: Colors.black,
      ),
      BottomNavigationBarItem(
        label: 'Explore',
        icon: const Icon(Icons.explore_outlined, color: Colors.white),
        backgroundColor: Colors.black,
      ),
      BottomNavigationBarItem(
        label: 'Saved',
        icon: const Icon(Icons.bookmark_border_outlined, color: Colors.white),
        backgroundColor: Colors.black,
      ),
      BottomNavigationBarItem(
        label: 'Profile',
        icon: const Icon(Icons.person_outlined, color: Colors.white),
        backgroundColor: Colors.black,
      ),
    ];
  }
}


    