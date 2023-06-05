import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      height: 45,
      width: double.infinity,
      child: Platform.isAndroid
          ? isOutline == true
              ? OutlinedButton(
                  onPressed: onPressed == null ? null : () => onPressed!(),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      width: 1,
                      color: onPressed == null
                          ? (disableColor ?? Colors.grey /*Color(0xffD9D9D9)*/)
                          : (enableColor ?? const Color(0xff4FB848)),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    title,
                    style: onPressed == null
                        ? (disableTextStyle ??
                            const TextStyle(
                              fontSize: 16,
                              color: Colors.grey /*Color(0xffD9D9D9)*/,
                              fontWeight: FontWeight.w400,
                            ))
                        : (enableTextStyle ??
                            const TextStyle(
                              fontSize: 16,
                              color: Color(0xff4FB848),
                              fontWeight: FontWeight.w400,
                            )),
                  ),
                )
              : ElevatedButton(
                  onPressed: onPressed == null ? null : () => onPressed!(),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    backgroundColor: MaterialStateProperty.all(onPressed != null
                        ? (enableColor ?? const Color(0xff4FB848))
                        : (disableColor ?? Colors.grey.shade400)),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
          : isOutline == true
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: onPressed == null
                          ? (disableColor ?? Colors.grey /*Color(0xffD9D9D9)*/)
                          : (enableColor ?? const Color(0xff4FB848)),
                    ),
                  ),
                  child: CupertinoButton(
                    onPressed: onPressed == null ? null : () => onPressed!(),
                    padding: const EdgeInsets.all(0),
                    borderRadius: BorderRadius.circular(5),
                    child: Text(
                      title,
                      style: onPressed == null
                          ? (disableTextStyle ??
                              const TextStyle(
                                fontSize: 16,
                                color: Colors.grey, //Color(0xffD9D9D9),
                                fontWeight: FontWeight.w400,
                              ))
                          : (enableTextStyle ??
                              const TextStyle(
                                fontSize: 16,
                                color: Color(0xff4FB848),
                                fontWeight: FontWeight.w400,
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
                      : (enableColor ?? const Color(0xff4FB848)),
                  borderRadius: BorderRadius.circular(5),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
    );
  }
}
