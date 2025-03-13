import 'package:flutter/material.dart';
import 'package:cashify/components/service_card.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({super.key});

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
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

  var refurbished = [
    ["https://s3no.cashify.in/builder/caa3a1efa51541a5aa37fd292790ea81.webp?p=default&s=lg", "Refurbished Phones"],
    ["https://s3no.cashify.in/builder/3e1f26febd3f4056a7ac5104a122aa94.webp?p=default&s=lg", "Refurbished Laptops"],
    ["https://s3no.cashify.in/builder/f1f0df2917bd410b8da95675c63be2d1.webp?p=default&s=lg", "Refurbished Smartwatches"]
  ];

  var others = [
    ["https://s3no.cashify.in/builder/b35c134330e5422699aed92d1254789d.webp?p=default&s=lg", "Repair Phone"],
    ["https://s3no.cashify.in/builder/4060695bca3447c2b7296aa5ba9ce827.webp?p=default&s=lg", "Find New Phone"],
    ["https://s3no.cashify.in/builder/ed7d743ec18f40f6b0cbb58bc6783d5b.webp?p=default&s=lg", "Recycle"],
    ["https://s3no.cashify.in/builder/522d89598f594f0ca6f9d22e40517db6.webp?p=default&s=lg", "Nearby Stores"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "All Services",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Sell For Cash Section
              Text(
                "Sell For Cash",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10), // Spacing
              SizedBox(
                height: 350, // Fixed height for GridView
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

              SizedBox(height: 20), // Space between sections

              /// Buy Refurbished Section
              Text(
                "Buy Refurbished",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10), // Spacing
              SizedBox(
                height: 120,
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                  physics: NeverScrollableScrollPhysics(),
                  children: refurbished.map((item) {
                    return ServiceCard(imageUrl: item[0],title:  item[1]);
                  }).toList(),
                ),
              ),

              SizedBox(height: 20), // Space between sections

              /// Others Section
              Text(
                "Others",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10), // Spacing
              SizedBox(
                height: 180,
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                  physics: NeverScrollableScrollPhysics(),
                  children: others.map((item) {
                    return ServiceCard(imageUrl: item[0], title: item[1]);
                  }).toList(),
                ),
              ),

              SizedBox(height: 20), // Space at the bottom
            ],
          ),
        ),
      ),
    );
  }

}
