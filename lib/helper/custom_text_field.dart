import 'package:flutter/material.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.onTap,
    this.isSelection = false,
    this.hindText = "",
    this.labelText = "",
    this.trailingWidget = const SizedBox(),
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.initialValue,
    required this.onChange,
    this.hintStyle,
    this.valueStyle,
    this.initSelectionValue,
    this.obscureText = false,
    this.maxLines,
    this.textInputAction,
    this.suffix,
  }) : super(key: key);
  final String hindText;
  final String labelText;
  final Widget trailingWidget;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final String? initialValue;
  final Function(String) onChange;
  final TextStyle? hintStyle;
  final TextStyle? valueStyle;
  final bool? obscureText;
  final bool? isSelection;
  final Function? onTap;
  final String? initSelectionValue;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final Widget? suffix;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText.isEmpty
            ? const SizedBox()
            : const SizedBox(
                height: 10,
              ),
        widget.labelText.isEmpty ? const SizedBox() : Text(widget.labelText),
        SizedBox(height: widget.labelText != '' ? 5 : 0),
        widget.isSelection == true
            ? GestureDetector(
                onTap: () => widget.onTap!(),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 46,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.initSelectionValue ?? widget.hindText,
                          style: TextStyle(
                            color: widget.initSelectionValue != null
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              )
            : TextFormField(
                cursorColor: AppConstant.kPrimaryColor,
                cursorRadius: const Radius.circular(10),
                cursorHeight: 20,
                cursorWidth: 2,
                textInputAction: widget.textInputAction ?? TextInputAction.next,
                maxLines: widget.maxLines ?? 1,
                initialValue: widget.initialValue ?? '',
                obscureText: widget.obscureText ?? false,
                onChanged: widget.onChange,
                keyboardType: widget.textInputType,
                style: widget.valueStyle ?? AppText.bodyMedium,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  suffixIcon: widget.suffixIcon,
                  hintStyle: widget.hintStyle ??
                      AppText.bodyMedium!.copyWith(color: Colors.grey),
                  hintText: widget.hindText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  suffix: widget.suffix,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: AppConstant.kPrimaryColor,
                      width: 1,
                    ),
                  ),
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
