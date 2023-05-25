import 'package:flutter/material.dart';

import 'Scan_QR.dart';
import 'SearchScreen.dart';

class Invite extends StatefulWidget {
  const Invite({Key? key}) : super(key: key);

  @override
  State<Invite> createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        elevation: 0,
        selectedItemColor: Colors.black,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.location_on_rounded),
            label: "Locator",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx)=> const QRCodeScreen()));
                },
                child: const Icon(Icons.qr_code)),
            label: "Scan QR",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchScreen()),
                  );
                },
                child: const Icon(Icons.search)),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Invite()));
                },
                child: const Icon(Icons.person_add_alt)),
            label: "Invite",
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text("Invite & Earn",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        ),
        actions: const [
          Icon(Icons.question_mark_sharp)
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              const Divider(height: 0.5,color: Colors.grey,),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Container(
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: const CircleAvatar(
                  backgroundColor: Colors.yellow,
                  radius: 62,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/Baber.photho.jpg",
                    ),
                    backgroundColor: Colors.yellow,
                    radius: 60,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              const Text("Total Earnings", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              const Text("Rs. 0", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Image.asset("assets/images/Registration.png", height: 100,width: 100,),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        const Text("Registrations", style: TextStyle( color: Colors.white, fontSize: 15),),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        const Text("Rs. 0", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 60)),
                  Column(
                    children: [
                      Image.asset("assets/images/Reactivations.jpeg", height: 100,width: 100,),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      const Text("Reactivations", style: TextStyle( color: Colors.white, fontSize: 15),),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      const Text("Rs. 0", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),),
                    ],
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            ),
            // height: 313,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Image.asset("assets/images/award.jpg",
                  width: 100,height: 200,),
                ),
                const SizedBox(width: 1,),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: const [
                      Text("Earn Up to Rs. 0 by Registering "),
                      Text("and reactivating your friends on "),
                      Text("JazzCash")
                    ],
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
