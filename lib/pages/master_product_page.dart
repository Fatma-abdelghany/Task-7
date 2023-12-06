import 'package:flutter/material.dart';
import 'package:shopify_app/pages/product_details.dart';
import 'package:shopify_app/pages/product_page.dart';
import 'package:shopify_app/pages/product_reviews.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/colors.util.dart';
import '../widgets/app_bar_ex.widget.dart';
import '../widgets/carousel_slider_ex.dart';
import '../widgets/product_app_bar.dart';
class MasterProductPage extends StatefulWidget {
  const MasterProductPage({super.key});

  @override
  State<MasterProductPage> createState() => _MasterProductPageState();
}

class _MasterProductPageState extends State<MasterProductPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool isProductAppBar=true;


  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductAppBarEx.getAppBar,
      body: Column(
        children: [
          const SizedBox(height: 20,),
          const AnimatedSmoothIndicator(
            activeIndex: 0,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.orange,
            ),
          ),
          const SizedBox(height: 5,),
          CarouselSliderEx(
              isForProduct: true,
              imageUrls: const [
                "https://m.media-amazon.com/images/I/81S-ekaE+vS._AC_UL320_.jpg",
                "https://m.media-amazon.com/images/I/61hMQOHmEIL._AC_UL320_.jpg",
                "https://m.media-amazon.com/images/I/81b9Eh286BL._AC_UL320_.jpg",
                "https://m.media-amazon.com/images/I/61U-R3-znNL._AC_UL320_.jpg"
              ], onBtnPressed: () {}),
          const SizedBox(height: 20,),

          buildTabBar(context),
          buildTabBarPages(),
        ],
      ),

    );
  }

  Widget buildTabBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TabBar(


        controller: _tabController,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.transparent,
        // change hover color
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered))
              return Color(0xfffffbff); //<-- SEE HERE
            return null;
          },),
        labelColor: ColorsUtil.badgeColor,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white),

        tabs:  [
          // first tab
          Tab(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Align(
                alignment: Alignment.center,
                child: Text("Product"),
              ),
            ),

          ),

          // second tab
          Tab(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Align(
                alignment: Alignment.center,
                child: Text("Details"),
              ),
            ),
          ),
          // third tab
          Tab(
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    border: Border.all(color: Colors.white, width: 1)),
    child: Align(
    alignment: Alignment.center,
    child: Text("Reviews"),
    ),
    ),
    ),

        ],
      ),
    );
  }


  Widget buildTabBarPages() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: const [
          // first tab bar view widget
          ProductPage(),

          // second tab bar view widget
          ProductDetailsPage(),
          // third tab bar view widget
          ProductReviewsPage()


        ],
      ),
    );
  }


}