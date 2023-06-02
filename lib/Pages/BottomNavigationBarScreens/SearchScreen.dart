import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Search",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 45,
              width: 350,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Adjust the offset values as needed
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.grey, // Specify the border color here
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5), // Specify the background color here
                  ),
                ),

              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Divider(
            height: 0.1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "      Trending Searches",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  child: const Text("Bank")),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  child: const Text("Send Money to JazzCash")),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  child: const Text("Mobile"))
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  child: const Text("TopUp")),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  child: const Text("Payoneer")),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  child: const Text("Debit Card"))
            ],
          ),
        ],
      ),
    );
  }
}

