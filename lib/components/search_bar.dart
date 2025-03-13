import 'package:flutter/material.dart';

class SearchBarView extends StatefulWidget {
  const SearchBarView({super.key});

  @override
  State<SearchBarView> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarView> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: "Search your Mobile Phone to sell",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
