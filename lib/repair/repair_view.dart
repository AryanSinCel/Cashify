import 'package:flutter/material.dart';

class RepairView extends StatefulWidget {
  const RepairView({super.key});

  @override
  State<RepairView> createState() => _RepairViewState();
}

class _RepairViewState extends State<RepairView> {
  var topBrands = [
    "https://s3no.cashify.in/cashify/brand/img/xhdpi/bf25222a-a2a7.jpg?p=default&s=lg",
    "https://s3no.cashify.in/cashify/brand/img/xhdpi/cb96df6e-080f.jpg?p=default&s=lg",
    "https://s3no.cashify.in/cashify/brand/img/xhdpi/406a512d-e8dd.jpg?p=default&s=lg",
    "https://s3no.cashify.in/cashify/brand/img/xhdpi/20922c34-8afc.jpg?p=default&s=lg",
    "https://s3no.cashify.in/cashify/brand/img/xhdpi/dfb6c340-010f.jpg?p=default&s=lg",
    "https://s3no.cashify.in/cashify/brand/img/xhdpi/0124cc45-3a6c.jpg?p=default&s=lg",
    "https://s3no.cashify.in/cashify/brand/img/xhdpi/06bc74db-4d38.jpg?p=default&s=lg",
    "https://s3no.cashify.in/cashify/brand/img/xhdpi/fef4e5ae-6507.jpg?p=default&s=lg",
    "https://s3no.cashify.in/cashify/brand/img/xhdpi/cfeaabff-69bf.jpg?p=default&s=lg",
    "https://s3no.cashify.in/cashify/brand/img/xhdpi/dacc50a2-77a9.jpg?p=default&s=lg",
    "https://s3no.cashify.in/cashify/brand/img/xhdpi/3e072dc2-6d7b.jpg?p=default&s=lg",
    "https://s3no.cashify.in/cashify/brand/img/xhdpi/e1b13cbc-ef06.jpg?p=default&s=lg"
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
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  /// Banner Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://s3no.cashify.in/cashify/web/2dcf9b22fe1749788bb79f79447a96e3.webp?p=default&s=lg",
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Top Brands Section
                  const Text("Top Brands", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 350,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: topBrands.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) => serviceCard(topBrands[index]),
                    ),
                  ),
                  const SizedBox(height: 0),

                  /// Repair Steps Section
                  Column(
                    children: [
                      repairStep(
                        "https://s3no.cashify.in/cashify/web/352dbff52b304fb6b795901b5dd78d6d.webp?p=default&s=lg",
                        "Check Price",
                        "Select your device that needs to be repaired. Get the best Pricing.",
                      ),
                      repairStep(
                        "https://s3no.cashify.in/cashify/web/63ae4e27b6d9482e82d8a8e0b4b9149a.webp?p=default&s=lg",
                        "Schedule Service",
                        "Book a free technician visit at your home or work at a time that suits your convenience.",
                      ),
                      repairStep(
                        "https://s3no.cashify.in/cashify/web/2db0da1e6ab844e899957b9c5d05b982.webp?p=default&s=lg",
                        "Get Device Repaired",
                        "Our super-skilled technician will be there and make it as good as new.",
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Why Us Section
                  const Text("Why Us", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        whyUsCard(
                          "https://s3no.cashify.in/estore/99953fd419e2416ba7dc25e0164372c3.png",
                          "Premium Repair",
                          "Top quality certified parts",
                        ),
                        whyUsCard(
                          "https://s3no.cashify.in/estore/acef68f939a84a8884640ae56f70867f.png?p=default&s=lg",
                          "Instant Mobile Repair",
                          "Repair on the Spot at Store or Home",
                        ),
                      ]),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      whyUsCard(
                        "https://s3no.cashify.in/estore/7989ad6b9431414481a1e9dcda098d45.png?p=default&s=lg",
                        "Physical Warranty",
                        "Free 1 Month Screen Replacement even if it breaks for all Screen Repair",
                      ),
                      whyUsCard(
                        "https://s3no.cashify.in/estore/3c0a0e2e0f4945c09e941a10bcf66e83.png?p=default&s=lg",
                        "6 Months Warranty",
                        "Hassle free 6 month warranty on parts replaced",
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      whyUsCard(
                        "https://s3no.cashify.in/estore/09bf461127cd48acb409f207e1664438.png?p=default&s=lg",
                        "Skilled Technicians",
                        "Trained & Qualified Professionals",
                      ),
                      whyUsCard(
                        "https://s3no.cashify.in/cashify/web/99e92ea8d2c040c2bf42d2e46c5b6a26.png?p=default&s=lg",
                        "Guaranteed Safety",
                        "Total Device & Data Security",
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  /// Widget for Repair Steps
  Widget repairStep(String imageUrl, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(description, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Widget for Service Cards (Top Brands)
  Widget serviceCard(String imageUrl) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(imageUrl, height: 50, width: 50, fit: BoxFit.cover,
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
      ),
    );
  }

  /// Widget for "Why Us" Section
  Widget whyUsCard(String imageUrl, String title, String description) {
    return Expanded(
      child: Column(
        children: [
          Image.network(imageUrl, width: 50, height: 50,
          loadingBuilder: (context, child, loadingProgress){
            if(loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(),
            );
          },errorBuilder: (context, error, stackTrace){
            return Icon(Icons.error); //To display if image is unable to fetch
            },
            ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          Text(description, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
