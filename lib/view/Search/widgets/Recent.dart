import 'package:flutter/material.dart';

import '../../Home/widgets/db.dart';

class RecentNew extends StatelessWidget {
  const RecentNew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 266,
      color: Colors.black,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xff1E1E1E),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
                  width: 200,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image.asset(
                        Glist[index],
                        fit: BoxFit.fill,
                      ))),
                      Text('Name.Subname',style: TextStyle(color: Color(0xffB8B8B8), fontSize: 16)),
                      Text('Meet Microsoft Office’s new default font: Aptos',
                      style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Date',style: TextStyle(color: Color(0xffB8B8B8), fontSize: 16)),
                  IconButton(onPressed: (){},
                   icon:Icon(Icons.bookmark_border_outlined,color: Color(0xffB8B8B8),size: 20,) )
                ],)
                      
            ]),
          ),
        ),
      ),
    );
  }
}