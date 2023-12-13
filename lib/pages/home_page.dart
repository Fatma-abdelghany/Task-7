
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/pages/product_page.dart';
import 'package:shopify_app/providers/product_provider.dart';
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


  @override
  void dispose() {
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
            buildCarouselSliderEx(),
      //=======================================================
            buildProductGrid(),


          ],
        ),
      ),
    );
  }

  Widget buildCarouselSliderEx() {
    return Consumer<ProductProvider>(builder: (ctx,productProvider,child){
      if(productProvider.products.isEmpty){
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: CircularProgressIndicator(),
        );
      }else{
      return CarouselSliderEx(
          isForProduct: false,
          imageUrls:productProvider.Ads  ,
          onBtnPressed: () {});
    }
    }
      )
      ;

  }


  Widget buildProductGrid() {
    return Consumer<ProductProvider>(builder: (context,productProvider,child){

      if(productProvider.products.isEmpty){
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: CircularProgressIndicator(),
        );
      }else{
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
           // scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(), //here
              shrinkWrap: true,
              itemCount: productProvider.productsNum,
              // itemCount: 3,
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
                        Align(
                          alignment: Alignment.topLeft
                          ,child: Column(
                          children: [
                            //  Text("Ankle Boots",style: TextStyle(fontSize:12,fontWeight: FontWeight.w300,color:Color(0xff515C6F) ),
                            Text(productProvider.products[index].name.toString(),style: TextStyle(fontSize:12,fontWeight: FontWeight.w300,color:Color(0xff515C6F) ),

                            ),
                            SizedBox(height: 5,),
                            //Text("\$49.99",style: TextStyle(fontSize:10,fontWeight: FontWeight.bold,color:Color(0xff515C6F)
                            Text("\$"+productProvider.products[index].price.toString(),style: TextStyle(fontSize:10,fontWeight: FontWeight.bold,color:Color(0xff515C6F)
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
    });
  }
}
