import 'package:flutter/material.dart';
import 'package:newzfeedz/controller/Controller.dart';
import 'package:provider/provider.dart';
//import 'package:newzfeedz/view/Home/widgets/db.dart';

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
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   elevation: 0,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      // Handle search input here
                      // You can filter the search options based on the value entered
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 60, // Adjust the height as needed
                child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal, // Set the scroll direction to horizontal
                  itemCount: searchOptions.length,
                  itemBuilder: (context, index) {
                    //final isSelected = option == selectedOption;
            
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          // Handle option selection here
            
                          _searchController.text = searchOptions[index];
                          setState(() {
                            isSelected = false;
                          });
                        },
                        child: Container(
                          width: 130,
                          //padding:EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xff1E1E1E)),
                          child: Center(
                              child: Text(
                            searchOptions[index],
                            style:
                                TextStyle(color: Color(0xffB8B8B8), fontSize: 18),
                          )),
                        ),
                      ),
                    );
                  },
                ),
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
              RecentNew(newsearch: _searchController.text,),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recommended',
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
              RecentNew(newsearch: _searchController.text,)
            ],
          ),
        ),
      ),
    );
  }
}


