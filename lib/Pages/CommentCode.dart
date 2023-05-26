/*Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: const [
                      Text("Money"),
                      Text("Transfer"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: const [
                      Text("Utility Bills"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: const [
                      Text("Mobile"),
                      Text("Load &"),
                      Text("packages"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: const [
                      Text("Banking &"),
                      Text("Finance"),
                    ],
                  ),
                )
              ],
            ),*/
// Row(
//   children: [
//     Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Column(
//         children: const [
//           Text("Debit Card"),
//         ],
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Column(
//         children: const [
//           Text("Mobile"),
//           Text("packages"),
//         ],
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25),
//       child: Column(
//         children: const [
//           Text("Raast"),
//         ],
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Column(
//         children: const [
//           Text("Savings Plan"),
//         ],
//       ),
//     )
//   ],
// ),
// Expanded(
//   flex: 1,
//   child: Center(
//     child: ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.black,
//           side: BorderSide(width:2, color:Colors.yellow),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
//       ),
//       onPressed: () {
//         if (_controller != null) {
//           _controller!.toggleFlash();
//         }
//       },
//       child: Text('Enable Flash'),
//     ),
//   ),
// ),
// import 'package:flutter/material.dart';
// import 'package:jazzcash/Pages/AppBar.dart';
// import 'package:jazzcash/Pages/SecondContainer.dart';
//
// import 'FirstContainer.dart';
//
// class FirstScreen extends StatefulWidget {
//   const FirstScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FirstScreen> createState() => _FirstScreenState();
// }
//
// class _FirstScreenState extends State<FirstScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color(0xfff3f3f3),
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: 0,
//           elevation: 0,
//           selectedItemColor: Colors.black,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: "Home",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.location_on_rounded),
//               label: "Locator",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.qr_code),
//               label: "Scan QR",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search),
//               label: "Search",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person_add_alt),
//               label: "Invite",
//             ),
//           ],
//         ),
//         appBar: const PreferredSize(
//           preferredSize: Size.fromHeight(50),
//           child: ApplicationToolBar(),
//         ),
//         body: Stack(
//           children: [
//             NestedScrollView(
//               headerSliverBuilder:
//                   (BuildContext context, bool innerBoxIsScrolled) {
//                 return [
//                   SliverAppBar(
//                     floating: true,
//                     pinned: true,
//                     expandedHeight: 222.0,
//                     flexibleSpace: LayoutBuilder(
//                       builder:
//                           (BuildContext context, BoxConstraints constraints) {
//                         return SingleChildScrollView(
//                           child: ConstrainedBox(
//                             constraints: BoxConstraints(
//                               minHeight: constraints.maxHeight,
//                             ),
//                             child: Container(
//                               color: const Color(0xfff3f3f3),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: const [
//                                   Divider(
//                                     height: 0.1,
//                                     color: Colors.white,
//                                   ),
//                                   FirstContainer(),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ];
//               },
//               body: CustomScrollView(
//                 slivers: [
//                   SliverList(
//                     delegate: SliverChildListDelegate([
//                       const SecondContainer(),
//                     ]),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 decoration:const  BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(15),
//                       topRight: Radius.circular(15)),
//                   color: Colors.grey,
//                 ),
//                 height: 25.0,
//                 width: 500,
//                 child: const SizedBox(
//                   width: 50,
//                   child: Icon(
//                     Icons.expand_less_sharp,
//                     color: Colors.black38,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
//
// // Column(
// //   children: const [
// //     Divider(
// //       height: 0.5,
// //     ),
// //     FirstContainer(),
// //     SecondContainer(),
// //
// //   ],
// // )