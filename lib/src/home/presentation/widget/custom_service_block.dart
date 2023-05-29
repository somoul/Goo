import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/src/home/presentation/screen/home_screen.dart';

class CustomServiceBlock extends StatelessWidget {
  final List<CategoriesItem> categoryList;
  const CustomServiceBlock({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              'សេវាកម្ម',
              style: AppText.titleSmall!
                  .copyWith(color: AppConstant.kPrimaryColor),
            )),
        const SizedBox(height: 5),
        SizedBox(
          height: 70,
          child: ListView.builder(
            itemCount: categoryList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Image.asset(
                    categoryList[index].iconSrc,
                    height: 35,
                  ),
                  const Spacer(),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      categoryList[index].iconName,
                      style: AppText.bodyMedium,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
