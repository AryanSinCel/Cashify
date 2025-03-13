import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomLocationView extends StatefulWidget {
  const BottomLocationView({super.key});

  @override
  State<BottomLocationView> createState() => _BottomLocationViewState();
}

class _BottomLocationViewState extends State<BottomLocationView> {

  TextEditingController searchController = TextEditingController();

  var topBrands = [
    ["https://s3n.cashify.in/estore/1ddfd9be1d4546a280cbc1ced0a731ad.svg","Bangalore"],
    ["https://s3n.cashify.in/estore/d0675cefdd86438581e32f095884d179.svg", "Chennai"],
    ["https://s3n.cashify.in/estore/84e2c1deede043cca4ca490cf7b6379c.svg", "Delhi"],
    ["https://s3n.cashify.in/estore/ae589baaf5924452abd846a33feacece.svg", "Gurgaon"],
    ["https://s3n.cashify.in/estore/81f658c1cbf640df8ea8a02d53d96647.svg", "Hyderabad"],
    ["https://s3n.cashify.in/estore/972bc4d6bd164a22b59007fb5252265a.svg", "Kolkata"],
    ["https://s3n.cashify.in/estore/e50489f21e8c43f4be9bb02d59658663.svg", "Mumbai"],
    ["https://s3n.cashify.in/estore/eff3602d60c34aaabef1b5853fdff327.svg", "Noida"],
    ["https://s3n.cashify.in/estore/4f2c5ddc1d914b448b334ad35bd619af.svg", "Pune"],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          height: 5,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Text("Choose your location", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close),
            ),
          ],
        ),
        SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("To check service availability in your area", style: TextStyle(color: Colors.grey)),
        ),
        SizedBox(height: 40),
        Row(
          children: [
            Text("Popular Cities", style: TextStyle(fontWeight: FontWeight.normal)),
            Spacer(),
            Text("View All Cities", style: TextStyle(color: Colors.grey, fontSize: 17)),
          ],
        ),
        SizedBox(height: 20),
        Expanded( // Ensures the GridView takes up remaining space
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: topBrands.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3x3 grid
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => serviceCard(topBrands[index][0], topBrands[index][1]),
          ),
        ),


        ///Search City
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: "Search your city or pincode",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Icon(Icons.search, color: Colors.black),
            ],
          ),
        ),


        SizedBox(height: 20,),

        //Detect Location Button

        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Color.fromRGBO(66, 200, 186, 1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 40,
                  width: 400,
                  child:
                  Align(
                      alignment: Alignment.center,
                      child:  Row(
                        children: [
                          Icon(Icons.my_location),
                          SizedBox(width: 10,),
                          Text("Detect My Location", style: TextStyle(color: Colors.black),),
                        ],
                      )
                  )
              ),
            ),
          ),
        ),

        SizedBox(height: 30,)

      ],
    );
  }

  Widget serviceCard(String imageUrl, String cityName) {
    return  Column(
      children: [
        SvgPicture.network(imageUrl, height: 80, width: 80, fit: BoxFit.cover, placeholderBuilder: (BuildContext context) => Center(
          child: CircularProgressIndicator(),
        ),),
        Text(cityName)
      ],
    );
  }

}
