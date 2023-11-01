import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';

class CustomContainTypeRentRow extends StatelessWidget {
  const CustomContainTypeRentRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppConstant.kPrimaryColor.withOpacity(0.15),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/image/favorite.svg',
              color: Colors.black,
              height: 16,
              width: 16,
            ),
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          "8 បន្ទប់គេង",
          style: AppText.bodyMedium!.copyWith(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}

class CustomContainTypeRentColum extends StatelessWidget {
  const CustomContainTypeRentColum({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppConstant.kPrimaryColor.withOpacity(0.15),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/image/favorite.svg',
              color: Colors.blue,
              height: 28,
              width: 28,
            ),
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Text("Car Parkicmbwkhng",
            style: AppText.bodyMedium!.copyWith(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis)
      ],
    );
  }
}
