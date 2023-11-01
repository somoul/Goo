import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'dart:io';

///[Noted] If you want to disable it => onPressed: null
class CustomButton extends StatelessWidget {
  final Function? onPressed;
  final String title;
  final bool? isOutline; // Defualt is normal button
  final TextStyle? enableTextStyle; // Overried enable TextStyle
  final TextStyle? disableTextStyle; // Overried disable TextStyle
  final Color? enableColor; // Overried enable button color
  final Color? disableColor; // Overried enable button color
  const CustomButton(
      {Key? key,
      this.onPressed,
      this.disableColor,
      this.enableColor,
      this.isOutline = false,
      required this.title,
      this.disableTextStyle,
      this.enableTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Platform.isAndroid
          ? isOutline == true
              ? OutlinedButton(
                  onPressed: onPressed == null ? null : () => onPressed!(),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    side: BorderSide(
                      width: 1,
                      color: onPressed == null
                          ? (disableColor ?? Colors.grey /*Color(0xffD9D9D9)*/)
                          : (enableColor ?? AppConstant.kPrimaryColor),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    title.tr,
                    style: onPressed == null
                        ? (disableTextStyle ??
                            const TextStyle(
                              fontSize: 16,
                              color: Colors.grey /*Color(0xffD9D9D9)*/,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Kantumruy',
                            ))
                        : (enableTextStyle ??
                            const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Kantumruy',
                              color: AppConstant.kPrimaryColor,
                              fontWeight: FontWeight.w400,
                            )),
                  ),
                )
              : ElevatedButton(
                  onPressed: onPressed == null ? null : () => onPressed!(),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 10)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    backgroundColor: MaterialStateProperty.all(onPressed != null
                        ? (enableColor ?? AppConstant.kPrimaryColor)
                        : (disableColor ?? Colors.grey.shade400)),
                  ),
                  child: Text(
                    title.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Kantumruy',
                    ),
                  ),
                )
          : isOutline == true
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: onPressed == null
                          ? (disableColor ?? Colors.grey /*Color(0xffD9D9D9)*/)
                          : (enableColor ?? AppConstant.kPrimaryColor),
                    ),
                  ),
                  child: CupertinoButton(
                    onPressed: onPressed == null ? null : () => onPressed!(),
                    padding: const EdgeInsets.all(0),
                    borderRadius: BorderRadius.circular(8),
                    child: Text(
                      title.tr,
                      style: onPressed == null
                          ? (disableTextStyle ??
                              const TextStyle(
                                fontSize: 16,
                                color: Colors.grey, //Color(0xffD9D9D9),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Kantumruy',
                              ))
                          : (enableTextStyle ??
                              const TextStyle(
                                fontSize: 16,
                                color: AppConstant.kPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Kantumruy',
                              )),
                    ),
                  ),
                )
              : CupertinoButton(
                  disabledColor: Colors.grey.shade400,
                  padding: const EdgeInsets.all(0),
                  onPressed: onPressed == null ? null : () => onPressed!(),
                  color: onPressed == null
                      ? (disableColor ?? Colors.grey.shade400)
                      : (enableColor ?? AppConstant.kPrimaryColor),
                  borderRadius: BorderRadius.circular(8),
                  child: Text(
                    title.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Kantumruy',
                    ),
                  ),
                ),
    );
  }
}
