import 'package:flutter/material.dart';
import 'package:newzfeedz/controller/Controller.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:share_plus/share_plus.dart';

import '../bottomNavigation/bottomNavigator.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key,required this.itemIndex,});
  final itemIndex;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  
  @override
  Widget build(BuildContext context) {
    final detailsController = Provider.of<Controller>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
                  onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigator(),));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  )),
                  title: Text('Details',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  centerTitle: true,
                  actions: [
                     IconButton(onPressed: (){
                    Share.share(detailsController.responsedata?.articles?[widget.itemIndex].url.toString()??"www.google.com");
                    }, icon: Icon(Icons.share_outlined,color: Colors.white,)),
                    
                  ],
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed: (){
          launchUrl(Uri.parse(detailsController.responsedata?.articles?[widget.itemIndex].url.toString()??''),
          mode: LaunchMode.inAppWebView
          );
        },
         label: Text('Read more',style: TextStyle(fontSize: 16),),backgroundColor: Colors.red,),
         body: SingleChildScrollView(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 350,
                color: Colors.amber,
                child: detailsController
                                    .responsedata?.articles?[widget.itemIndex].urlToImage
                                     == null ? 
                          Image.network('https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
                           fit: BoxFit.fill,
                            width: double.infinity,
                            height: 300,): Image.network(
                            detailsController
                                    .responsedata?.articles?[widget.itemIndex].urlToImage
                                    .toString()??
                                '',
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: 300,
                          ),
              ),
              SizedBox(height: 10,),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20),
              //   child: Text('Category',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
              // ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 10),
                child: Container(
                  width: double.infinity,
                  height: 110,
                  color: Colors.black,
                  child: Text(detailsController.responsedata?.articles?[widget.itemIndex].title.toString() ?? '',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text( detailsController.responsedata?.articles?[widget.itemIndex].author.toString()??'Author',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(detailsController.responsedata?.articles?[widget.itemIndex].publishedAt.toString()??'date',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w300),),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Image.asset('assets/images/Icons (2).png'),
                  SizedBox(width: 20,),
                  Image.asset('assets/images/Icons (4).png'),
                  SizedBox(width: 20,),
                  Image.asset('assets/images/Icons (3).png')
                ],),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 10),
                child: Container(
                  width: double.infinity,
                  height: 800,
                  color: Colors.black,
                  child: detailsController
                                        .responsedata?.articles?[widget.itemIndex].urlToImage
                                         == null ? Text(''):
                  Text(detailsController.responsedata?.articles?[widget.itemIndex].description.toString()??'news',style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    ),),
                ),
              )
            ],
           ),
         ),
     
        backgroundColor: Colors.black,
      ),
    );
  }
}
