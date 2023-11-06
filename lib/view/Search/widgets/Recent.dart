import 'package:flutter/material.dart';
//import 'package:newzfeedz/models/Newsmodel.dart';
import 'package:provider/provider.dart';

import '../../../controller/Controller.dart';
//import '../../Home/widgets/db.dart';

class RecentNew extends StatefulWidget {
  const RecentNew({super.key, required this.newsearch});
  final newsearch;

  @override
  State<RecentNew> createState() => _RecentNewState();
}

class _RecentNewState extends State<RecentNew> {
  @override
  void initState() {
    Provider.of<Controller>(context, listen: false)
        .searchdata(search: widget.newsearch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _Search_Controller = Provider.of<Controller>(context);
    return _Search_Controller.isloading ==true?Center(child: 
    CircularProgressIndicator(
      color: Colors.red,
    ),):
    Container(
      width: double.infinity,
      height: 302,
      color: Colors.black,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xff1E1E1E),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  width: 200,
                  height: 115,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child:_Search_Controller
                                        .responsedata?.articles?[index].urlToImage
                                         == null ?  Image.network('https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
                               fit: BoxFit.fill,
                                width: double.infinity,
                                height: 300,):
                       Image.network(
                        _Search_Controller
                                .responsedata?.articles?[index].urlToImage
                                .toString() ??
                            '',
                        fit: BoxFit.fill,
                      ))),
                      SizedBox(height: 10,),
              Text(_Search_Controller.responsedata?.articles?[index].source?.name.toString()??"failed to laod data",
                  style: TextStyle(color: Color(0xffB8B8B8), fontSize: 16)),
              Container(width: 200,
              height: 100,
                child: Text(_Search_Controller.responsedata?.articles?[index].title.toString()??"failed to laod data",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_Search_Controller.responsedata?.articles?[index].publishedAt.toString()??"failed to laod data",
                      style: TextStyle(color: Color(0xffB8B8B8), fontSize: 12)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark_border_outlined,
                        color: Color(0xffB8B8B8),
                        size: 20,
                      ))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
