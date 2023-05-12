import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondContainer extends StatefulWidget {
  const SecondContainer({Key? key}) : super(key: key);

  @override
  State<SecondContainer> createState() => _SecondContainerState();
}

class _SecondContainerState extends State<SecondContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "My JazzCash",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 150,
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit"))
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: buildIconButton("assets/images/paper-plane.svg", "Money Transfer", (){
                    debugPrint("shit is about to get real");
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: buildIconButton("assets/images/invoice.svg", "Utility Bills", (){
                    debugPrint("shit is about to get real");
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: buildIconButton("assets/images/mobile.svg", "Mobile load & Package", (){
                    debugPrint("shit is about to get real");
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: buildIconButton("assets/images/magnet.svg", "Banking & Finance", (){
                    debugPrint("shit is about to get real");
                  }),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Top Picks for You",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: buildIconButton("assets/images/person.svg", "Debit Card", (){
                    debugPrint("shit is about to get real");
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: buildIconButton("assets/images/person.svg", "Mobile Package", (){
                    debugPrint("shit is about to get real");
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: buildIconButton("assets/images/bank.svg", "Raast", (){
                    debugPrint("shit is about to get real");
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: buildIconButton("assets/images/tv.svg", "Savings Plan", (){
                    debugPrint("shit is about to get real");
                  }),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        "assets/images/offer4.png",
                        height: 135,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      "assets/images/offer2.png",
                      height: 135,
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  // SizedBox(width: 10,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      "assets/images/offer3.jpg",
                      height: 135,
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                  // SizedBox(width: 20,),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children:  [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Latest Updates",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    "assets/images/offer7.png",
                    height: 135,
                    width: 330,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



Widget buildIconButton(String svgAssetPath, String caption, onPressed) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffd2d2d2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 2),
            )
          ],
          border: Border.all(
            color: Color(0xffe1e1e1),
            width: 1.0, // adjust as needed
          ),
          color: Colors.white,
        ),
        child: IconButton(
          icon: SvgPicture.asset(
            svgAssetPath,
          ),
          onPressed: onPressed,
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 10),
        width: 55,
        child: Text(
          caption,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ],
  );
}
