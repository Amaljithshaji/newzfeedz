import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:newzfeedz/view/Home/widgets/db.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  //  GlobalKey<CarouselSliderState> _sliderKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20,top: 10),
            child: Container(
              height: 300,
              child: CarouselSlider.builder(
                  //  key: _sliderKey,
                  enableAutoSlider: true,
                  autoSliderDelay: Duration(seconds: 3),
                  unlimitedMode: true,
                  slideBuilder: (index) {
                    return Stack(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: Image.asset(
                              Glist[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            )),
                        Positioned(
                            bottom: 70,
                            left: 20,
                            child: Text(
                              "date",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            )),
                        Positioned(
                            bottom: 40,
                            left: 20,
                            child: Text(
                              "title",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ))
                      ],
                    );
                  },
                  slideTransform: CubeTransform(),
                  slideIndicator: CircularSlideIndicator(
                    indicatorRadius: 3,
                    itemSpacing: 10,
                    padding: EdgeInsets.only(bottom: 12),
                  ),
                  itemCount: 5),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('Top Stories',style: TextStyle(
              color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800
            ),),
            Text('See all',style: TextStyle(
              color: Colors.grey,fontSize: 18,fontWeight: FontWeight.w400
              ),)
          ],),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: 317,
            color: Colors.black,
            child: ListView.builder(itemCount: 10,
              itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
              child: Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff1E1E1E)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 5),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),color: Colors.indigo,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(Glist[index],fit: BoxFit.fill,),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.only(top: 10,right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name . Subname',style: TextStyle(
                                  color: Colors.grey,fontSize: 14
                                ),),
                                Container(
                                  width: 230,
                                  height:80,
                                 // color: Colors.amber,
                                  child: Text("v;dklf;lsd;dnb;skhahsdvcjkcbhajksdbvjkbvksjbcjhzxbvkjasbdvkljba",style: TextStyle(
                                    color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold
                                  ),),
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
                            padding: const EdgeInsets.only(right: 220),
                            child: Text('data',style: TextStyle(
                              color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w400
                            ),),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border_outlined,
                          size: 20,color: Colors.white,)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,size: 20,))

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),),
          )
        ],
      ),
    );
  }
}
