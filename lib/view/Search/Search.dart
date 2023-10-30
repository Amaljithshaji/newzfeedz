import 'package:flutter/material.dart';
import 'package:newzfeedz/controller/Controller.dart';
import 'package:provider/provider.dart';
//import 'package:newzfeedz/view/Home/widgets/db.dart';

import '../details/detailscreen.dart';
import 'widgets/Recent.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  bool iselected = false;
  bool isSelected = false;
  List<String> searchOptions = [
    'General'
    'Tech',
    'Science',
    'Sports',
    'Health',
    'Business',
    'Entertainment',
  ];
  
  @override
  void initState() {
    Provider.of<Controller>(context,listen: false).searchdata(search: _searchController.text);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _Search = Provider.of<Controller>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   elevation: 0,
      // ),
      body: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70,),
              Container(
                width: 380,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff1E1E1E)),
                child: Center(
                  child: TextField(
                    style: TextStyle(color: Color(0xffB8B8B8)),
                    controller: _searchController,
                    decoration: InputDecoration(
                        hintText: 'Search for news',
                        hintStyle:
                            TextStyle(color: Color(0xffB8B8B8), fontSize: 18),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 30,
                        ),
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusColor: Colors.grey,
                        labelStyle: TextStyle(color: Color(0xffB8B8B8)),
                        prefixIconColor: Color(0xffB8B8B8)),
                    onChanged: (value) {
                      _Search.isloading =false;
                     _Search.searchdata(search: _searchController.text);
                     _Search.isloading = true;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
             
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent News',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'view more',
                    style: TextStyle(color: Color(0xffB8B8B8), fontSize: 16),
                  ),
                ],
              ),
            Container(
              width: double.infinity,
              height: 600,
              color: Colors.black,
              child:_Search.isloading == true? 
      Center(child: CircularProgressIndicator(
        color: Colors.red,
      ),):
               ListView.builder(
                itemCount: _Search.responsedata?.articles?.length,
                itemBuilder: (context, index) =>
                 Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: InkWell(
                    onDoubleTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(itemIndex: index,),
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
                            padding: const EdgeInsets.only(left: 15, top: 5),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.indigo,
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.network(
                                      _Search.responsedata?.articles?[index]
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
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _Search.responsedata
                                                ?.articles?[index].source?.name
                                                .toString() ??
                                            "Source",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 230,
                                        height: 70,
                                        // color: Colors.amber,
                                        child: Text(
                                          _Search.responsedata
                                                  ?.articles?[index].description
                                                  .toString() ??
                                              "no data",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 80),
                                  child: Text(
                                    _Search.responsedata?.articles?[index]
                                        .publishedAt?.toLocal()
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


