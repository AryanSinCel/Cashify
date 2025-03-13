import 'package:flutter/material.dart';

class SaleContainer extends StatefulWidget {
  const SaleContainer({super.key});

  @override
  State<SaleContainer> createState() => _SaleContainerState();
}

class _SaleContainerState extends State<SaleContainer> {

  var cashifyImageUrl = "https://s3no.cashify.in/estore/658f05797b2d4354a604fe75c5c0499a.webp?p=default&s=lg";
  var goldImageUrl = "https://s3no.cashify.in/estore/e1f01d90f1784d86856fbc3639e476f6.webp?p=default&s=lg";

  var flashSaleImageUrl = [
    ["https://s3no.cashify.in/cashify/product/img/xxhdpi/36ea82c3-6d6a.jpg?p=es3sq&s=es", "Apple iPhone 14 - Refurbished","-54%","₹36,499","₹79,900","₹34,822"],
    ["https://s3no.cashify.in/cashify/product/img/xxhdpi/1b4543b6-be95.jpg?p=es3sq&s=es", "Apple iPhone 12 mini - Refurbished","-51%","₹21,299","₹43,699","₹20,078"],
    ["https://s3no.cashify.in/cashify/product/img/xxhdpi/96a67b00-9389.jpg?p=es3sq&s=es", "Apple iPhone 13 - Refurbished","-47%","₹31,899","₹59,699","₹30,360"],
    ["https://s3no.cashify.in/cashify/product/img/xxhdpi/5b276976-cfb2.jpg?p=es3sq&s=es", "Apple iPhone 12 Pro Max - Refurbished","-55%","₹39,699","₹88,999","₹37,360"],
    ["https://s3no.cashify.in/cashify/product/img/xxhdpi/83ff20f9-b7bc.jpg?p=es3sq&s=es", "Apple iPhone 11 Pro - Refurbished","-50%","₹24,499","₹50,299","₹23,667"],
    ["https://s3no.cashify.in/cashify/product/img/xxhdpi/a69ef28f-fe68.jpg?p=es3sq&s=es", "Samsung Galaxy S24 Ultra 5G - Refurbished","-49%","₹76,499","₹1,50,299","₹74,667"]
  ];


  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      child: Row(
        children: flashSaleImageUrl.map((item) {
          return Padding(
            padding: const EdgeInsets.only(right: 5), // Add spacing between items
            child: Column(
              children: [
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child: ClipRRect( // Clip image to avoid overflow
                    borderRadius: BorderRadius.circular(5),
                    child: SizedBox(
                        width: 220,
                        // Define fixed width
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Image.network(cashifyImageUrl , width: 60, height: 20,
                                  loadingBuilder: (context, child, loadingProgress){
                                    if(loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },errorBuilder: (context, error, stackTrace){
                                    return Icon(Icons.error); //To display if image is unable to fetch
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                height: 120,
                                child:   Image.network(
                                  item[0], // Image URL
                                  fit: BoxFit.cover, // Cover the box properly
                                ),
                              ),

                              Text(
                                item[1], // Title
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                textAlign: TextAlign.center, maxLines: 2,
                              ),

                              Row(
                                children: [
                                  Text(item[2], style: TextStyle(color: Colors.red, fontSize: 15),),
                                  SizedBox(width: 10,),
                                  Text(item[3], style: TextStyle(fontSize: 15),),
                                  SizedBox(width: 10,),
                                  Text(item[4], style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),)
                                ],
                              ),

                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0), // Add padding for spacing
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.amber.shade400, Colors.transparent], // Gradient from gold to transparent
                                    begin: Alignment.centerLeft,
                                    end: Alignment.center,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(item[5], style: TextStyle(fontWeight: FontWeight.bold)),
                                    SizedBox(width: 5),
                                    Text("with"),
                                    SizedBox(width: 5),
                                    Image.network(goldImageUrl, width: 40, height: 30),
                                  ],
                                ),
                              )

                            ],
                          ),
                        )

                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
