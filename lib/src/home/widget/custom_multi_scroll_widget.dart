import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';

class CustomMultiScrollWidget extends StatelessWidget {
  const CustomMultiScrollWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.height,
      child: PageView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Row(
              children: [
                const SizedBox(
                  width: AppConstant.padding,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // GoRouter.of(context).push('/find_new_location_screen');
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/icons/Promotion.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                const SizedBox(
                  width: AppConstant.padding,
                ),
                Expanded(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/avengers.jpeg',
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            );
          }),
    );
  }
}
