import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:newzfeedz/view/Notification/NotificationScreen.dart';
import 'package:newzfeedz/view/Search/Search.dart';
//import 'package:newzfeedz/view/profile/profile.dart';

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
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 0, 0, 0)
            ],
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
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.0,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: DefaultTabController(
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
                        key: ValueKey<bool>(value.visible),color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
              title: Text('Newz Feedz', style: GoogleFonts.aDLaMDisplay(color: Colors.white)),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ));
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
              bottom: TabBar(
                  physics: AlwaysScrollableScrollPhysics(),
                  isScrollable: true,
                  indicatorColor: Colors.red,
                  labelStyle: TextStyle(fontSize: 18),
                  labelColor: Colors.white,
                  tabs: [
                    Tab(
                      text: 'General',
                    ),
                    Tab(
                      text: 'Tech',
                    ),
                    Tab(
                      text: 'Science',
                    ),
                    Tab(
                      text: 'Sports',
                    ),
                    Tab(
                      text: 'Health',
                    ),
                    Tab(
                      text: 'Business',
                    ),
                    Tab(
                      text: 'Entertainment',
                    ),
                  ]),
            ),
            body:
                TabBarView(physics: NeverScrollableScrollPhysics(), children: [
              Container(
                width: double.infinity,
                height: 500,
                color: Colors.black,
                child: Category(
                  category: 'general',
                ),
              ),
              Container(
                width: double.infinity,
                height: 500,
                color: Colors.black,
                child: Category(
                  category: 'technology',
                ),
              ),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.black,
                child: Category(
                  category: 'Science',
                ),
              ),
              Container(
                width: double.infinity,
                height: 500,
                color: Colors.black,
                child: Category(
                  category: 'Sports',
                ),
              ),
              Container(
                width: double.infinity,
                height: 500,
                color: Colors.black,
                child: Category(
                  category: 'Health',
                ),
              ),
              Container(
                width: double.infinity,
                height: 500,
                color: Colors.black,
                child: Category(
                  category: 'Business',
                ),
              ),
              Container(
                width: double.infinity,
                height: 500,
                color: Colors.black,
                child: Category(
                  category: 'Entertainment',
                ),
              ),
            ])),
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
                  child: Center(
                      child: Text('Newz Feedz ',
                          style: GoogleFonts.aDLaMDisplay(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.red,
                          ))),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigator(),
                        ));
                  },
                  leading: Icon(Icons.feed_rounded),
                  title: Text('Feeds'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ));
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
                    child: InkWell(
                        onTap: () {
                          showModalBottomSheet(

                            context: context,
                            builder: (context) => Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 435,
                              color: Colors.black,
                              child: Column(children: [
                                Container(
                                  width: 50,
                                  height: 10,
                                  
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),color: Colors.grey.shade300,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  'Terms and Conditions',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width * 0.9,
                                      height: 389,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Please read these terms and conditions carefully before using the NewzFeedz app.',style: TextStyle(color: Colors.white),),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('1. Acceptance of Terms',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'By using the NewzFeedz app, you agree to comply with and be bound by the following terms and conditions. If you do not agree to these terms, please do not use the app.',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('2. Use of the App',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'You may use NewzFeedz for personal, non-commercial purposes.',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                ' You are not permitted to download, copy, or distribute the apps content, including text, images, or any other media, without explicit written consent.',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('3. Sharing',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'The NewzFeedz app allows sharing of articles, images, and content via the built-in sharing options. You may use these sharing features in accordance with applicable laws.',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Do not misuse the sharing features for any unlawful, harmful, or inappropriate purposes.',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                '4. Copyright and Intellectual Property',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'All content within NewzFeedz is protected by copyright and other intellectual property rights',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'You may not use, reproduce, or distribute any content from NewzFeedz without permission.',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('5. User-Generated Content',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'You may be able to submit user-generated content, such as comments or feedback. By submitting content, you grant NewzFeedz the right to use, modify, and display the content.',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('6. Privacy',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'NewzFeedz collects and processes personal data as described in our Privacy Policy. By using the app, you consent to our data practices as described in the Privacy Policy.',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('7. Disclaimers',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'NewzFeedz provides news and information for general purposes. We do not guarantee the accuracy or completeness of the content.',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'We are not responsible for any third-party websites, services, or content that may be linked or referenced in the app.',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('8. Changes to Terms',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'NewzFeedz may modify these terms and conditions at any time. It is your responsibility to review them periodically for updates.',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'By using the NewzFeedz app, you acknowledge that you have read, understood, and agreed to these terms and conditions. If you do not agree with these terms, please do not use the app.',style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      )),
                                )
                              ]),
                            ),
                          );
                        },
                        child: Text('Terms of Service | Privacy Policy')),
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
