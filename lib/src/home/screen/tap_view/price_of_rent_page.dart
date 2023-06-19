import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import '../../widget/custom_card_rent_widget.dart';
import '../home_screen.dart';

class PriceOfRentPage extends StatelessWidget {
  const PriceOfRentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        // Text(
        //   "តម្លៃជួល",
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // ),
        // SizedBox(
        //   height: 10,
        // ),
        // Text("១.តម្លៃ 60 ដុល្លា។"),
        // SizedBox(
        //   height: 5,
        // ),
        // Text("២.បង់កក ៦០ ដុល្លា។"),
        // SizedBox(
        //   height: 5,
        // ),
        // Text("៣.ទឹក១០០០រៀល ១គិប ភ្លើង ១០០០រៀល ១គីឡូ"),
        ...listTypeOfRent.map((e) => CustomCardRentWidget(
              imageSrc: e.imageSrc,
              typeName: e.typeName,
              location: e.location,
              sizeRent: e.sizeRent,
              horizontal: AppConstant.padding,
              code: e.code,
              priceOfRent: e.priceOfRent,
              iconOfCard: e.iconCard,
            )),
      ],
    );
  }
}
