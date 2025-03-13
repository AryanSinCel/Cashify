
import 'package:cashify/login/login_view.dart';
import 'package:cashify/person/bottom_location_view.dart';
import 'package:flutter/material.dart';
import 'package:cashify/location_service.dart';

class PersonView extends StatefulWidget {
  const PersonView({super.key});

  @override
  State<PersonView> createState() => _PersonViewState();
}

class _PersonViewState extends State<PersonView> {
  String cityName = "Fetching location...";

  @override
  void initState() {
    super.initState();
    _fetchCity();
  }

  Future<void> _fetchCity() async {
    String city = await LocationService.getCityName();
    setState(() {
      cityName = city;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // General padding for better layout
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              // Location Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.place_outlined, color: Colors.grey),
                  const SizedBox(width: 8),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your City", style: TextStyle(color: Colors.grey)),

                        Row(
                          children: [
                            Text(cityName),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: MediaQuery.of(context).size.height * 0.9, // Ensures 80% of screen height
                                      padding: EdgeInsets.all(10),

                                      ///Bottom Location Sheet
                                      child: BottomLocationView(),

                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.keyboard_arrow_down_outlined),
                            ),
                          ],
                        ),


                      ]),
                ],
              ),


          const SizedBox(height: 20),

          // Profile Card
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Aryan Singh",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: const [
                      Text("+91 7518509725", style: TextStyle(color: Colors.grey)),
                      Text(" | ", style: TextStyle(color: Colors.grey)),
                      Text("aryansin1105@gmail.com", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Three Action Buttons
          Wrap(
            spacing: 5,
            alignment: WrapAlignment.center,
            children: [
              _buildCard(Icons.shopping_bag_outlined, "My Orders"),
              _buildCard(Icons.chat_bubble_outline_outlined, "Chat with Us"),
              _buildCard(Icons.favorite_outline, "Refer & Earn"),
            ],
          ),

          const SizedBox(height: 30),

          // List Items
          _buildListItem(Icons.shopping_bag_outlined, "My Orders"),
          _buildListItem(Icons.phone_in_talk_outlined, "Services", trailing: Icons.add),
          _buildListItem(Icons.settings_outlined, "Settings", trailing: Icons.add),
          _buildListItem(Icons.info_outline, "About", trailing: Icons.add),
          _buildListItem(Icons.redeem, "Refer & Earn"),
          _buildListItem(Icons.local_offer_outlined, "New Offers"),
          _buildListItem(Icons.monetization_on_outlined, "My Earnings"),
          _buildListItem(Icons.help_outline, "Help", trailing: Icons.add),

          const SizedBox(height: 30),

          // Log Out Button
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                // Log Out functionality
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    LoginView(),
                ));
              },
              child: const Text(
                "Log Out",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Build Version
          Align(
            alignment: Alignment.center,
            child: const Text(
              "Build : 1.0 (1.0.0)",
              style: TextStyle(color: Colors.grey),
            ),
          ),
         ]),
        ),
      ),
    );
  }

  // Helper function to create a card
  Widget _buildCard(IconData icon, String title) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Icon(icon),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }

  // Helper function to create a list item with a divider
  Widget _buildListItem(IconData icon, String title, {IconData? trailing}) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(title),
            const Spacer(),
            if (trailing != null) Icon(trailing),
          ],
        ),
        const Divider(),
      ],
    );
  }


}
