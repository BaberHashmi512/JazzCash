import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FirstContainer extends StatefulWidget {
  const FirstContainer({Key? key}) : super(key: key);

  @override
  State<FirstContainer> createState() => _FirstContainerState();
}

class _FirstContainerState extends State<FirstContainer> {
  final double number = 84.59;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#.##", "en_US");
    final formattedNumber = formatter.format(number);
    final parts = formattedNumber.split(".");
    final wholeNumber = parts[0];
    final decimalPart = parts[1];
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
      ),
      // height: 210,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: const CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 25,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/Baber.photho.jpg",
                      ),
                      backgroundColor: Colors.yellow,
                      radius: 23,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: const [
                  Text(
                    "Good Afternoon!",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                    width: 5,
                  ),
                  Text(
                    "  Baber Ali Hashmi",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(left: 150)),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.qr_code_scanner_rounded,
                      color: Colors.white)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(children: [
                  const Text(
                    "Rs. ",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    wholeNumber,
                    style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    ".$decimalPart",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ]),
              ),
              const Icon(
                Icons.refresh,
                color: Colors.yellow,
              ),
              const Padding(padding: EdgeInsets.only(left: 100)),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text(
                    "Loan",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.yellow),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text("Add Money")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {},
                    icon: const Icon(Icons.add_card),
                    label: const Text("My Account")),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class FirstContainer extends StatefulWidget {
//   const FirstContainer({Key? key}) : super(key: key);
//
//   @override
//   State<FirstContainer> createState() => _FirstContainerState();
// }
//
// class _FirstContainerState extends State<FirstContainer> {
//   final double number = 84.59;
//   bool _isScrolledToTop = true;
//
//   @override
//   Widget build(BuildContext context) {
//     final formatter = NumberFormat("#.##", "en_US");
//     final formattedNumber = formatter.format(number);
//     final parts = formattedNumber.split(".");
//     final wholeNumber = parts[0];
//     final decimalPart = parts[1];
//
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       height: _isScrolledToTop ? 210.0 : 80.0,
//       decoration: const BoxDecoration(
//         color: Colors.black87,
//         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(5)),
//                   child: const CircleAvatar(
//                     backgroundColor: Colors.yellow,
//                     radius: 25,
//                     child: CircleAvatar(
//                       backgroundImage: AssetImage(
//                         "assets/images/Baber.photho.jpg",
//                       ),
//                       backgroundColor: Colors.yellow,
//                       radius: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Column(
//                 children: const [
//                   Text(
//                     "Good Afternoon!",
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 4,
//                     width: 5,
//                   ),
//                   Text(
//                     "  Baber Ali Hashmi",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold, color: Colors.white),
//                   ),
//                 ],
//               ),
//               const Padding(padding: EdgeInsets.only(left: 150)),
//               Container(
//                   decoration: BoxDecoration(
//                       color: Colors.black38,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: const Icon(Icons.qr_code_scanner_rounded,
//                       color: Colors.white)),
//             ],
//           ),
//           if (_isScrolledToTop)
//             const SizedBox(
//               height: 10,
//             ),
//           if (_isScrolledToTop)
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Row(
//                     children: [
//                       const Text(
//                         "Rs. ",
//                         style: TextStyle(
//                             fontSize: 40,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                       Text(
//                         wholeNumber,
//                         style: const TextStyle(
//                             fontSize: 45,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         ".$decimalPart",
//                         style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Icon(
//                   Icons.refresh,
//                   color: Colors.yellow,
//                 ),
//                 const Padding(padding: EdgeInsets.only(left: 100)),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     "Loan",
//                     style:
//                     TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
//                   ),
//                 ),
//               ],
//             ),
//           if (!_isScrolledToTop)
//             const SizedBox(height: 10),
//           if (!_isScrolledToTop)
//             const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }