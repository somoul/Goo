import 'package:flutter/material.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/src/home/widget/custom_card_rent_widget.dart';
import 'package:goo_rent/src/profile/presentation/screen/rented_room.dart';

class RentingRoomPage extends StatelessWidget {
  const RentingRoomPage({Key? key, required this.checkAccount})
      : super(key: key);
  final String checkAccount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ...listTypeOfRent1.map((e) => CustomCardRentWidget(
                checkAccount: checkAccount,
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
      ),
    );
  }
}
