import 'package:flutter/material.dart';
import 'package:jazzcash/Pages/AppBar.dart';
import 'package:jazzcash/Pages/SecondContainer.dart';

import 'FirstContainer.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          elevation: 0,
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_rounded),
              label: "Locator",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: "Scan QR",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt),
              label: "Invite",
            )
          ]
      ),
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50), child: ApplicationToolBar()),
        body:CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 210.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Divider(height: 0.1,color: Colors.white,),
                    FirstContainer(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SecondContainer(),
            )
          ],
        ),

        // Column(
        //   children: const [
        //     Divider(
        //       height: 0.5,
        //     ),
        //     FirstContainer(),
        //     SecondContainer(),
        //
        //   ],
        // )
    );
  }
}
