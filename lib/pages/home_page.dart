import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/pages/product_page.dart';
import 'package:shopify_app/seeder/data.seeder.dart';
import 'package:shopify_app/widgets/carousel_slider_ex.dart';
import 'package:shopify_app/widgets/headline.widget.dart';
import 'package:shopify_app/widgets/home/categories_row.home.widget.dart';

import 'master_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  List productsImages=[
    "assets/images/women_shoes.png",
    "assets/images/backpack.png",
    "assets/images/scarf.png",
  ];
  ValueNotifier<List<int>> listNotifier = ValueNotifier<List<int>>([]);

  void addValueToList() {
    listNotifier.value.add(Random().nextInt(100));
    listNotifier.notifyListeners();
    setState(() {});
  }

  @override
  void dispose() {
    listNotifier.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await DataSeeder.loadData();
    setState(() {});
    _isLoading = false;
  }

  ValueNotifier<int> indexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeadlineWidget(title: 'Categories'),
            CategoriesRowHome(),
            ValueListenableBuilder(
                valueListenable: indexNotifier,
                builder: (context, value, _) {
                  return CarouselSliderEx(
                    isForProduct: false,
                      imageUrls: [
                    "https://m.media-amazon.com/images/I/81S-ekaE+vS._AC_UL320_.jpg",
                    "https://m.media-amazon.com/images/I/61hMQOHmEIL._AC_UL320_.jpg",
                    "https://m.media-amazon.com/images/I/81b9Eh286BL._AC_UL320_.jpg",
                    "https://m.media-amazon.com/images/I/61U-R3-znNL._AC_UL320_.jpg"
                  ], onBtnPressed: () {});
                }),
      //=======================================================
            buildProductGrid(),


          ],
        ),
      ),
    );
  }


  Widget buildProductGrid() {
    return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(), //here
                shrinkWrap: true,
                itemCount: 3,
                gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 170,


                ),
                itemBuilder: (_,index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                         context,
                      MaterialPageRoute(builder: (_) => MasterProductPage()));


                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,

                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            productsImages[index],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10,),
                          const Align(
                            alignment: Alignment.topLeft
                            ,child: Column(
                            children: [
                              Text("Ankle Boots",style: TextStyle(fontSize:12,fontWeight: FontWeight.w300,color:Color(0xff515C6F) ),
                              ),
                              SizedBox(height: 5,),
                              Text("\$49.99",style: TextStyle(fontSize:10,fontWeight: FontWeight.bold,color:Color(0xff515C6F)
                              ),
                              )
                            ],
                          ),
                          ),

                        ],
                      ),
                    ),
                  );
                }
            ),
          );
  }
}
