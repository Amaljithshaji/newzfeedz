import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newzfeedz/controller/Controller.dart';
import 'package:newzfeedz/view/Notification/NotificationScreen.dart';
import 'package:provider/provider.dart';

import '../Search/Search.dart';
import '../bottomNavigation/bottomNavigator.dart';
import 'detailscreen.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({super.key, required this.category});
  final category;
  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  @override
  void initState() {
    Provider.of<Controller>(context, listen: false)
        .fetchdata(cate: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final see_all = Provider.of<Controller>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigator(),
                  ));
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        title: Text(
          'Top News',
          style: GoogleFonts.aDLaMDisplay(),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ));
              },
              child: Image.asset("assets/images/Icons (1).png")),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotifScreen(),
                    ));
              },
              child: Image.asset("assets/images/Icons.png")),
          SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 750,
                color: Colors.black,
                child: see_all.isloading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      )
                    : ListView.builder(
                        itemCount: see_all.responsedata?.articles?.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: InkWell(
                            onDoubleTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      itemIndex: index,
                                    ),
                                  ));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xff1E1E1E)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, top: 5),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.indigo,
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            child: Image.network(
                                              see_all
                                                      .responsedata
                                                      ?.articles?[index]
                                                      .urlToImage
                                                      .toString() ??
                                                  '',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                see_all
                                                        .responsedata
                                                        ?.articles?[index]
                                                        .source
                                                        ?.name
                                                        .toString() ??
                                                    "Source",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: 230,
                                                height: 70,
                                                // color: Colors.amber,
                                                child: Text(
                                                  see_all
                                                          .responsedata
                                                          ?.articles?[index]
                                                          .description
                                                          .toString() ??
                                                      "no data",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 80),
                                          child: Text(
                                            see_all
                                                    .responsedata
                                                    ?.articles?[index]
                                                    .publishedAt
                                                    ?.toLocal()
                                                    .toString() ??
                                                "date",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.bookmark_border_outlined,
                                              size: 20,
                                              color: Colors.white,
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.more_vert,
                                              color: Colors.white,
                                              size: 20,
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
