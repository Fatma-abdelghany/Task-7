import 'package:flutter/material.dart';

import '../utils/colors.util.dart';

class ProductAppBarEx {
  static PreferredSizeWidget get getAppBar => AppBar(
    centerTitle: true,
    leading: IconButton(
        onPressed: () {},
        icon: Image.asset('assets/images/back.png')
    ),
    title: Column(
      children: [
        Text("Faux Sued Ankle Boots"),
        //Text("Faux Sued Ankle Boots"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("\$49.99"),
            SizedBox(width: 15,),

            Container(
              padding:EdgeInsets.symmetric(horizontal: 5) ,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffFF6969)
              ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset('assets/images/star.png'),
                SizedBox(width: 5,),
                Text("\$4.9"),

              ],
            )),
          ],
        ),

      ],
    ),

    actions: [
      Stack(
        children: [
          IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/Cart.png')
          ),

          Positioned(
              bottom: 6,
              child: Badge(
                backgroundColor: ColorsUtil.badgeColor,
                label: Text('5'),
              ))
        ],
      ),

    ],
  );
}
