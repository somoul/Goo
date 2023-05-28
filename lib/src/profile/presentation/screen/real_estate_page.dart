import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RealEstatePage extends StatelessWidget {
  const RealEstatePage({Key? key}) : super(key: key);
  static const String routeName = "/real_estate_page";

  @override
  Widget build(BuildContext context) {
    List<RealEstateEntitie> list = const [
      RealEstateEntitie(
          description: "ឈូកមាសជិតផ្សា",
          imgScr: "assets/image2/1.png",
          qty: "មានចំនួន 30 បន្ទប់"),
      RealEstateEntitie(
          description: "ផ្ទះជួល",
          imgScr: "assets/image2/2.png",
          qty: "មានចំនួន 30 បន្ទប់"),
      RealEstateEntitie(
          description: "ឃ្លាំងជួល",
          imgScr: "assets/image2/6.png",
          qty: "មានចំនួន 30 បន្ទប់"),
      RealEstateEntitie(
          description: "ដីជួល",
          imgScr: "assets/image2/7.png",
          qty: "មានចំនួន 30 បន្ទប់"),
      RealEstateEntitie(
          description: "ការិយាល័យជួល",
          imgScr: "assets/image2/5.png",
          qty: "មានចំនួន 30 បន្ទប់"),
      RealEstateEntitie(
          description: "អាផាតមិនជួល",
          imgScr: "assets/image2/4.png",
          qty: "មានចំនួន 30 បន្ទប់"),
      RealEstateEntitie(
          description: "តូបជួល",
          imgScr: "assets/image2/3.png",
          qty: "មានចំនួន 30 បន្ទប់"),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
        centerTitle: true,
        title: Text(
          "អចលនទ្រព្យខ្ញុំ",
          style: GoogleFonts.kantumruy(fontSize: 18, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: [
            ...list.map((e) => Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: ListTile(
                      onTap: () {
                        // GoRouter.of(context).push(MyPropertyPage.routeName,
                        //     extra: "ownaccount");
                      },
                      contentPadding:
                          const EdgeInsets.only(right: 15, left: 15),
                      horizontalTitleGap: 8,
                      leading: Image.asset(
                        e.imgScr,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(
                        e.description,
                        style: GoogleFonts.kantumruy(),
                      ),
                      subtitle: Text(
                        e.qty,
                        style: GoogleFonts.kantumruy(color: Colors.grey),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_sharp),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class RealEstateEntitie {
  final String imgScr;
  final String description;
  final String qty;

  const RealEstateEntitie(
      {required this.description, required this.imgScr, required this.qty});
}
