import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:newzfeedz/controller/Controller.dart';
//import 'package:newzfeedz/view/Home/widgets/db.dart';
import 'package:newzfeedz/view/details/detailscreen.dart';
import 'package:newzfeedz/view/details/seeAll.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Category extends StatefulWidget {
  const Category({super.key, required this.category});
  final category;
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  //  GlobalKey<CarouselSliderState> _sliderKey = GlobalKey();

  @override
  void initState() {
    Provider.of<Controller>(context, listen: false)
        .fetchdata(cate: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeProvider = Provider.of<Controller>(context);
    var SelectValue;
    return HomeProvider.isloading == true
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          )
        : RefreshIndicator(
            onRefresh: () async {
              await HomeProvider.fetchdata(cate: widget.category);
            },
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Container(
                      height: 290,
                      child: CarouselSlider.builder(
                          //  key: _sliderKey,
                          enableAutoSlider: true,
                          autoSliderDelay: Duration(seconds: 10),
                          unlimitedMode: true,
                          // scrollPhysics: NeverScrollableScrollPhysics(),
                          slideBuilder: (index) {
                            return Stack(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    color: Colors.white,
                                    child: HomeProvider.responsedata
                                                ?.articles?[index].urlToImage ==
                                            null
                                        ? Image.asset(
                                            'assets/images/nodata.jpg',
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: 300,
                                          )
                                        : Image.network(
                                            HomeProvider
                                                    .responsedata
                                                    ?.articles?[index]
                                                    .urlToImage
                                                    .toString() ??
                                                '',
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: 300,
                                          )),
                                Positioned(
                                    bottom: 100,
                                    left: 20,
                                    child: HomeProvider.responsedata
                                                ?.articles?[index].urlToImage ==
                                            null
                                        ? Text('')
                                        : Text(
                                            HomeProvider
                                                    .responsedata
                                                    ?.articles?[index]
                                                    .publishedAt
                                                    .toString() ??
                                                "date",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          )),
                                Positioned(
                                  bottom: 5,
                                  left: 20,
                                  child: Container(
                                    width: 300,
                                    child: HomeProvider.responsedata
                                                ?.articles?[index].urlToImage ==
                                            null
                                        ? Text(
                                            'No data found',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        : Text(
                                            HomeProvider.responsedata
                                                    ?.articles?[index].title
                                                    .toString() ??
                                                "title",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 20,
                                  child: InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                              itemIndex: index,
                                            ),
                                          )),
                                      child: Image.asset(
                                          'assets/images/Frame.png')),
                                )
                              ],
                            );
                          },
                          slideTransform: CubeTransform(),
                          slideIndicator: CircularSlideIndicator(
                            indicatorRadius: 3,
                            itemSpacing: 10,
                            padding: EdgeInsets.only(bottom: 5),
                          ),
                          itemCount: 5),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Stories',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SeeAll(category: widget.category),
                              ));
                        },
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 317,
                    color: Colors.black,
                    child: ListView.builder(
                      itemCount: HomeProvider.responsedata?.articles?.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: Container(
                          width: double.infinity,
                          height: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff1E1E1E)),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 5),
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                          itemIndex: index,
                                        ),
                                      )),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xff1E1E1E),
                                        ),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            child: HomeProvider
                                                        .responsedata
                                                        ?.articles?[index]
                                                        .urlToImage ==
                                                    null
                                                ? Image.asset(
                                                    'assets/images/nodata.jpg',
                                                    fit: BoxFit.fill,
                                                    width: double.infinity,
                                                    height: 300,
                                                  )
                                                : Image.network(
                                                    HomeProvider
                                                            .responsedata
                                                            ?.articles?[index]
                                                            .urlToImage
                                                            .toString() ??
                                                        '',
                                                    fit: BoxFit.fill,
                                                    width: double.infinity,
                                                    height: 300,
                                                  )),
                                      ),
                                     
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              HomeProvider
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
                                              width: MediaQuery.of(context).size.width * 0.5,
                                              height: 70,
                                            //  color: Colors.amber,
                                              child: HomeProvider
                                                          .responsedata
                                                          ?.articles?[index]
                                                          .urlToImage ==
                                                      null
                                                  ? Text(
                                                      'No data found',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  : Text(
                                                      HomeProvider
                                                              .responsedata
                                                              ?.articles?[index]
                                                              .title
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
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      HomeProvider.responsedata
                                              ?.articles?[index].publishedAt
                                              .toString() ??
                                          "date",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        value: SelectValue,
                                        elevation: 0,
                                        iconEnabledColor: Colors.black,
                                        focusColor: Colors.black,
                                        dropdownColor:
                                            Color.fromARGB(255, 21, 21, 21),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        enableFeedback: true,
                                        items: [
                                          DropdownMenuItem<String>(
                                            enabled: false,
                                            child: TextButton(
                                              onPressed: () {
                                                launchUrl(
                                                    Uri.parse(HomeProvider
                                                            .responsedata
                                                            ?.articles?[index]
                                                            .url
                                                            .toString() ??
                                                        ''),
                                                    mode: LaunchMode
                                                        .inAppWebView);
                                              },
                                              child: Text(
                                                'Read more',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            value: 'read more',
                                          ),
                                          DropdownMenuItem<String>(
                                            child: TextButton(
                                              onPressed: () {
                                                Share.share(HomeProvider
                                                        .responsedata
                                                        ?.articles?[index]
                                                        .url
                                                        .toString() ??
                                                    "www.google.com");
                                              },
                                              child: Text(
                                                'Share',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            value: 'Share',
                                          )
                                        ],
                                        onChanged: (newValue) {
                                          SelectValue = newValue;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
