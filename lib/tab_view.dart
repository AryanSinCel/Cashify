import 'package:cashify/buy/buy_view.dart';
import 'package:cashify/person/person_view.dart';
import 'package:cashify/repair/repair_view.dart';
import 'package:cashify/sell/sell_view.dart';
import 'package:cashify/services/service_view.dart';
import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int myIndex = 0;

  List<Widget> screens = [
    SellView(),
    BuyView(),
    RepairView(),
    ServiceView(),
    PersonView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
        BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined), label: "Sell"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Buy"),
        BottomNavigationBarItem(icon: Icon(Icons.home_repair_service_outlined), label: "Repair"),
            BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), label: "Services"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: "Person")
      ]),
      body: screens[myIndex],
    );
  }
}
