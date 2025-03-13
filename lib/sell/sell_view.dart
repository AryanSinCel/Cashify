import 'package:cashify/components/image_carousel.dart';
import 'package:cashify/components/search_bar.dart';
import 'package:flutter/material.dart';
import '../components/horizontal_image_scroller.dart';
import '../components/service_card.dart';

class SellView extends StatefulWidget {
  const SellView({super.key});

  @override
  State<SellView> createState() => _SellViewState();
}

class _SellViewState extends State<SellView> {

  var sellForCash = [
    ["https://inventstore.in/wp-content/uploads/2024/09/68-1536x1536.webp", "Sell Phone"],
    ["https://m.media-amazon.com/images/I/510uTHyDqGL._AC_UF1000,1000_QL80_.jpg", "Sell Laptop"],
    ["https://s3no.cashify.in/builder/1a1126c5c49f47b29cbb3aa63e6b385e.webp?p=default&s=lg", "Sell TV"],
    ["https://s3no.cashify.in/builder/a12ac14b386b4b5286d424a83db4cad5.webp?p=default&s=lg", "Sell Tablet"],
    ["https://s3no.cashify.in/builder/cc8cb8f956374059b0816815dd36b865.webp?p=default&s=lg", "Sell Imac"],
    ["https://s3no.cashify.in/builder/5aba5b44686349a4a54d457016a257ac.webp?p=default&s=lg", "Sell Gaming Console"],
    ["https://s3no.cashify.in/builder/b4faefec66da492b9b3bf8ff47d42041.webp?p=default&s=lg", "Sell Refrigerator"],
    ["https://s3no.cashify.in/builder/66b5ebd126064a54b5bc9682b0adbf75.webp?p=default&s=lg", "Sell Car"],
    ["https://s3no.cashify.in/builder/bdd27d377ce34bb0b73c8f1b4a860bbd.webp?p=default&s=lg", "Sell DSLR Camera"],
    ["https://s3no.cashify.in/builder/abd3c512bbac4232a95e0e15f5d3bbaf.webp?p=default&s=lg", "Sell Smart Speaker"],
    ["https://s3no.cashify.in/builder/dd86b01438cb403fb4c01cef4a01d97a.webp?p=default&s=lg", "Sell AC"]
  ];

  var others = [
    ["https://s3no.cashify.in/builder/b35c134330e5422699aed92d1254789d.webp?p=default&s=lg", "Repair Phone"],
    ["https://s3no.cashify.in/builder/4060695bca3447c2b7296aa5ba9ce827.webp?p=default&s=lg", "Find New Phone"],
    ["https://s3no.cashify.in/builder/ed7d743ec18f40f6b0cbb58bc6783d5b.webp?p=default&s=lg", "Recycle"],
    ["https://s3no.cashify.in/builder/522d89598f594f0ca6f9d22e40517db6.webp?p=default&s=lg", "Nearby Stores"],
    ["https://s3no.cashify.in/builder/16f1d0a9fb4448f8a971e259dc612f54.webp?p=default&s=lg", "Repair Laptop"]
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color: Colors.grey.shade300,
                width: 240,
                height: 35,
                child: TabBar(
                  labelColor: Colors.white, // Selected tab color
                  indicatorAnimation: TabIndicatorAnimation.elastic,
                  unselectedLabelColor: Colors.black, // Unselected tab color
                  indicatorColor: Colors.white, // Underline indicator color
                  isScrollable: false, // Allows left alignment
                  indicator: BoxDecoration(
                      color: Color.fromRGBO(66, 200, 183, 1),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  indicatorPadding: EdgeInsets.all(0),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: "Sell"),
                    Tab(text: "Buy"),
                    Tab(text: "Repair"),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                  /// **Search Bar Card**
                  const SizedBox(height: 10),

                  SearchBarView(),

                  const SizedBox(height: 15), // Space between search bar and carousel

                  ImageCarousel(),

                  ///Sell For Cash Section
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sell For Cash",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(
                        height: 360, // Fixed height for GridView
                        child: GridView.count(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8,
                          physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
                          children: sellForCash.map((item) {
                            return ServiceCard(imageUrl: item[0],title:  item[1]);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),

                  ///Others Section
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Others",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(
                        height: 260, // Fixed height for GridView
                        child: GridView.count(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8,
                          physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
                          children: others.map((item) {
                            return ServiceCard(imageUrl: item[0],title:  item[1]);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),

                  ///Hot Deals Section
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Hot Deals",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Exciting offers for more value",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.grey),
                        ),
                      ),

                      const SizedBox(height: 10,),

                      HorizontalImageScroller(
                        imageUrls: [
                          "https://s3no.cashify.in/estore/d2866450bd5d4aec83dbf61277ab5e3f.webp?p=es4&s=es",
                          "https://s3no.cashify.in/estore/60a36c0f312c4cb88bb7612ad7e583e8.webp?p=es4&s=es",
                          "https://s3no.cashify.in/estore/8123d1f070bb49b6bc8bbae2dccbd4be.webp?p=es4&s=es",
                          "https://s3no.cashify.in/estore/4ea9f5e5bb2648a4ad05395b0b8e7e20.webp?p=es4&s=es",
                        ],
                      )
                    ],
                  )

                ],
              ),
            ),
          ),
        )
    );
  }
}
