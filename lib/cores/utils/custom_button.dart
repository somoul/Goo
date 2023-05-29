import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';

class CustomButton extends StatelessWidget {
  final Function? onPressed;
  final String title;
  final bool? isOutline;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 50,
      child: Platform.isAndroid
          ? SizedBox(
              height: 50,
              child: isOutline == false
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: Colors.grey[400],
                        backgroundColor: AppConstant.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: onPressed == null ? null : () => onPressed!(),
                      child: Text(
                        title,
                        style: AppText.titleSmall!.copyWith(
                            color: onPressed != null
                                ? Colors.grey[200]
                                : Colors.white),
                      ),
                    )
                  : OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            width: 1, color: AppConstant.kPrimaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: onPressed == null ? null : () => onPressed!(),
                      child: Text(
                        title,
                      ),
                    ),
            )
          : isOutline == false
              ? CupertinoButton.filled(
                  onPressed: onPressed == null ? null : () => onPressed!(),
                  child: Text(title,
                      style: AppText.titleSmall!.copyWith(
                          color: onPressed != null
                              ? Colors.white
                              : Colors.grey[200])),
                )
              : Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: onPressed == null
                            ? Colors.grey[300]!
                            : AppConstant.kPrimaryColor,
                      )),
                  child: CupertinoButton(
                    disabledColor: Colors.red,
                    onPressed: onPressed == null ? null : () => onPressed!(),
                    child: Text(
                      title,
                      style: AppText.titleSmall!.copyWith(
                        color: onPressed == null
                            ? Colors.grey[200]
                            : AppConstant.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
    );
  }
}
