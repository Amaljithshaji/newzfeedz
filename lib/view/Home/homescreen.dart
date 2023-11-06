import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newzfeedz/view/Notification/NotificationScreen.dart';
import 'package:newzfeedz/view/Search/Search.dart';
import 'package:newzfeedz/view/profile/profile.dart';


import '../bottomNavigation/bottomNavigator.dart';
import 'widgets/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 0, 0, 0), Color.fromARGB(255, 0, 0, 0)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child:
     DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
           leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          title: Text('Newz Feedz',style: GoogleFonts.aDLaMDisplay()),
          actions: [
              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
              }, child: Image.asset("assets/images/Icons (1).png")),
            // InkWell(onTap: () {
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => NotifScreen(),));
            // }, child: Image.asset("assets/images/Icons.png")),
            SizedBox(width: 10,),
            // InkWell(
            //     onTap: () {
            //       Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
            //     },
            //     child: Image.asset(
            //       "assets/images/Vector.png",
            //       width: 25,
            //       height: 25,
            //     )),
            //     SizedBox(width: 16,)
          ],
          bottom: TabBar(
            physics: AlwaysScrollableScrollPhysics(),
            isScrollable: true,
            indicatorColor: Colors.red,
            labelStyle: TextStyle(fontSize: 18),
            tabs: [
            Tab(text: 'General',),
            Tab(text: 'Tech',),
            Tab(text: 'Science',),
            Tab(text: 'Sports',),
            Tab(text: 'Health',),
            Tab(text: 'Business',),
            Tab(text: 'Entertainment',),
          ]),
        ),
        body: TabBarView(physics: NeverScrollableScrollPhysics(),
          children: [
         Container(
          width: double.infinity,
          height: 500,
          color: Colors.black,
          child: Category(category: 'general',),
         ),
          Container(
          width: double.infinity,
          height: 500,
          color: Colors.black,
          child: Category(category: 'technology',),
          ),
         
          Container(
          width: double.infinity,
          height: 400,
          color: Colors.black,
          child: Category(category: 'Science',),
         ),
          Container(
          width: double.infinity,
          height: 500,
          color: Colors.black,
          child: Category(category: 'Sports',),
         ),
          Container(
          width: double.infinity,
          height: 500,
          color: Colors.black,
          child: Category(category: 'Health',),
         ),
          Container(
          width: double.infinity,
          height: 500,
          color: Colors.black,
          child: Category(category: 'Business',),
         ),
          Container(
          width: double.infinity,
          height: 500,
          color: Colors.black,
          child: Category(category: 'Entertainment',),
         ),
         
        ])
      ),
      
    ),
    drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.red,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 180.0,
                  height: 100.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.rectangle,
                  ),
                  child:Center(child: Text('Newz Feedz ',style: GoogleFonts.aDLaMDisplay( fontWeight: FontWeight.bold, fontSize: 28,color: Colors.red,))),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigator(),));
                  },
                  leading: Icon(Icons.feed_rounded),
                  title: Text('Feeds'),
                ),
                
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
                  },
                  leading: Icon(Icons.explore_outlined),
                  title: Text('Explore'),
                ),
               
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
    void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
  }

