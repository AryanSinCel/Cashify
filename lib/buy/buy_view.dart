import 'package:cashify/components/sale_container.dart';
import 'package:flutter/material.dart';
import 'package:cashify/components/image_carousel.dart';
import 'package:cashify/components/search_bar.dart';

class BuyView extends StatefulWidget {
  const BuyView({super.key});

  @override
  State<BuyView> createState() => _BuyViewState();
}

class _BuyViewState extends State<BuyView> {

  var refurbishedImageUrl = [
    ["https://s3no.cashify.in/estore/56dbce203c8d4686bb85dc9207e1b8d2.webp?p=default&s=lg","Smart Watches"],
    ["https://s3no.cashify.in/estore/0a450a296681464b801fed6d753872e6.webp?p=default&s=lg","Laptops"],
    ["https://s3no.cashify.in/estore/135a8b8adb994199a9c6b04fb5bfdea7.webp?p=default&s=lg","Tablets"],
    ["https://s3no.cashify.in/estore/802a9de11b894d8ba790a5018e2bd653.webp?p=default&s=lg","Limited Time"],
    ["https://s3no.cashify.in/estore/ff736ac9b0104a229db689d099dbb830.webp?p=default&s=lg","Top Offers"],
    ["https://s3no.cashify.in/estore/396644a2988c47aba8e0b4bd0d99ad38.webp?p=default&s=lg","New Launches"],
    ["https://s3no.cashify.in/estore/818056d1ec0f4717b40744337b336bf1.webp?p=default&s=lg","Gaming Consoles"]
  ];


  var favoriteBrandImageUrl = [
    ["https://s3no.cashify.in/estore/d3abed491a974d0bae84c21e1f7c96bd.webp?p=es1sq&s=es","₹13,899"],
    ["https://s3no.cashify.in/estore/009c40d8abce40ce9bbfe1dc31cc4588.webp?p=es1sq&s=es","₹5,599"],
    ["https://s3no.cashify.in/estore/074194479ff645c887be8de00e55a40b.webp?p=es1sq&s=es","₹6,599"],
    ["https://s3no.cashify.in/estore/77dd0b0b75654d4399d6c654669e8df7.webp?p=es1sq&s=es","₹3,599"],
    ["https://s3no.cashify.in/estore/a77a0220333f40f2b82096c2980c362e.webp?p=es1sq&s=es","₹6,199"],
    ["https://s3no.cashify.in/estore/882fd9f1a1264daa8f214ee81f0b279e.webp?p=es1sq&s=es","₹5,799"],
    ["https://s3no.cashify.in/estore/5dd67bb05ef34fc58a4ec87e988f12c8.webp?p=es1sq&s=es","₹5,499"],
    ["https://s3no.cashify.in/estore/43bac286e28f49fba0098618a2bd558d.webp?p=es1sq&s=es","₹7,299"],
    ["https://s3no.cashify.in/estore/2c9b1a6a6b364548b6d034ee2066f1a8.webp?p=es1sq&s=es","₹8,799"],
    ["https://s3no.cashify.in/estore/c015eeb0d7da4268ac82e0bc66ec1043.webp?p=es1sq&s=es","₹6,699"]
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              title: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: Colors.white,
                  width: 240,
                  height: 35,
                  child: TabBar(
                    labelColor: Colors.white, // Selected tab color
                    indicatorAnimation: TabIndicatorAnimation.elastic,
                    unselectedLabelColor: Colors.black, // Unselected tab color
                    indicatorColor: Colors.white, // Underline indicator color
                    isScrollable: false, // Allows left alignment
                    indicator: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    indicatorPadding: EdgeInsets.all(5),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(text: "Sell"),
                      Tab(text: "Buy"),
                      Tab(text: "Repair"),
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                  onPressed: () {
                    // Navigate to cart
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: [
                      /// **Search Bar Card**
                      const SizedBox(height: 15),

                      SearchBarView(),

                      const SizedBox(height: 15), // Space between search bar and carousel

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                        child: Row(
                          children: refurbishedImageUrl.map((item) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 5), // Add spacing between items
                              child: Column(
                                children: [
                                  Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                    child: ClipRRect( // Ensures rounded corners for the image
                                      borderRadius: BorderRadius.circular(5),
                                      child: SizedBox(
                                        height: 85, // Set a fixed height
                                        width: 85,  // Set a fixed width
                                        child: Image.network(
                                          item[0], // Image URL
                                          fit: BoxFit.cover, // Ensures image covers the entire space
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5), // Space between image and text
                                  SizedBox(
                                    width: 85, // Ensure text stays within the card's width
                                    child: Text(
                                      item[1], // Title
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis, // Prevents long text overflow
                                      maxLines: 1, // Limits text to 2 lines
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(height: 15,),

                      ///Image Carousel
                      ImageCarousel(),

                      ///Favorite Brands
                      const SizedBox(height: 15,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Favorite Brands",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                        child: Row(
                          children: favoriteBrandImageUrl.map((item) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 5), // Add spacing between items
                              child: Column(
                                children: [
                                  Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                    child: ClipRRect( // Clip image to avoid overflow
                                      borderRadius: BorderRadius.circular(5),
                                      child: SizedBox(
                                        height: 100, // Define fixed height
                                        width: 100,  // Define fixed width
                                        child: Image.network(
                                          item[0], // Image URL
                                          fit: BoxFit.cover, // Cover the box properly
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5), // Space between image and text
                                  const Text("Starting From", style: TextStyle(fontSize: 10)),
                                  Text(
                                    item[1], // Title
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(height: 10,),

                      ///Flash Sales
                      ///
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Flash Sale",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text("View all",style: TextStyle(color: Colors.grey),)
                            ],
                          ),

                          SaleContainer()


                        ],
                      )

                    ]),
              ),
            )
        ));
  }
}
