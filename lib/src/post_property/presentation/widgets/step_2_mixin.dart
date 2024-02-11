import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/src/home/data/slide_categorie_model/slide_categorie_model.dart';
import 'package:goo_rent/src/post_property/presentation/widgets/radio_button.dart';
import 'package:goo_rent/utils/extension/widget.dart';

mixin Step2Mixin {
  Widget radioButton(
    BuildContext context, {
    required VoidCallback onTop,
    required bool value,
    required String label,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width - 95,
            minWidth: (MediaQuery.sizeOf(context).width * 0.35),
          ),
          child: Expanded(
            child: Text(
              label,
              style: AppText.titleSmall!.copyWith(fontSize: 14),
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxHeight: 60, maxWidth: 60),
          child: InkWell(
            borderRadius: BorderRadius.circular(60),
            onTap: onTop,
            child: RadioButton(value: value).p(10),
          ),
        )
      ],
    );
  }

  Widget disPlay2Radio(
    BuildContext context, {
    required VoidCallback onTop,
    required bool value,
    required String label,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.5,
            minWidth: (MediaQuery.sizeOf(context).width * 0.25),
          ),
          child: Expanded(
            child: Text(
              label,
              style: AppText.titleSmall!.copyWith(fontSize: 14),
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxHeight: 60, maxWidth: 60),
          child: InkWell(
            borderRadius: BorderRadius.circular(60),
            onTap: onTop,
            child: RadioButton(value: value).p(10),
          ),
        )
      ],
    );
  }

  Widget textField({
    int maxLines = 1,
    Widget? suffix,
    required RowField field,
    VoidCallback? onSelect,
    required Function(String) onChange,
    TextInputType? keyboardType,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(field.label ?? '',
                style: AppText.titleSmall!.copyWith(fontSize: 14))
            .pt(15)
            .pb(6),
        TextFormField(
          controller: field.controller as TextEditingController,
          cursorColor: AppConstant.kPrimaryColor,
          cursorRadius: const Radius.circular(10),
          cursorHeight: 20,
          cursorWidth: 1.5,
          maxLines: maxLines,
          autocorrect: false,
          readOnly: onSelect != null,
          onTap: onSelect,
          keyboardType: keyboardType,
          style: const TextStyle(height: 1.5, fontSize: 14),
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            suffixIcon: suffix,
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 50, minHeight: 30),
            alignLabelWithHint: true,
            hintStyle:
                AppText.bodyMedium!.copyWith(fontSize: 14, color: Colors.grey),
            hintText: field.hint ?? '',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            fillColor: field.checkString.isNotEmpty
                ? Colors.transparent
                : Colors.grey.withOpacity(0.1),
            filled: true,
            errorStyle: const TextStyle(color: Colors.red, height: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: AppConstant.kPrimaryColor,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.red,
                width: .5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: field.checkString.isNotEmpty
                    ? AppConstant.kPrimaryColor
                    : Colors.transparent,
                width: .5,
              ),
            ),
          ),
          validator: (val) {
            if (field.required) {
              if (val?.isEmpty ?? false) {
                return '${'Please enter'.tr} ${(field.label ?? '').toLowerCase()}';
              }
            }
            return null;
          },
          onChanged: onChange,
        ),
      ],
    );
  }

  ////Text Fields Render
  // Widget renderTextField(
  //     {required List<FieldModel> textFields,
  //     required VoidCallback onSelected}) {
  //   return Column(
  //     children: [
  //       ...textFields.asMap().entries.map(
  //         (fColum) {
  //           if ((fColum.value.field?.length ?? 0) <= 2 &&
  //               fColum.value.field != null) {
  //             return Row(
  //               children: [
  //                 ...fColum.value.field!.asMap().entries.map(
  //                   (fRow) {
  //                     bool notSelect = !fRow.value.isSelect;
  //                     if (fRow.value.isDisplay) {
  //                       return Expanded(
  //                         child: textField(
  //                           ///Local check
  //                           maxLines: fRow.value.maxLines,
  //                           onSelect: notSelect ? null : onSelected,
  //                           suffix: fRow.value.suffixAsset == null
  //                               ? null
  //                               : ClipRRect(
  //                                   borderRadius: 8.borderRadius,
  //                                   child: ImageBuilder()
  //                                       .asset(fRow.value.suffixAsset ?? ''),
  //                                 ).px(10),

  //                           ///From API
  //                           field: fRow.value,
  //                           onChange: (val) {},
  //                         ).pr(fRow.key == 0 ? 8 : 0).pl(fRow.key == 1 ? 8 : 0),
  //                       );
  //                     }
  //                     return const SizedBox();
  //                   },
  //                 ).toList(),
  //               ],
  //             ).px(16);
  //           }

  //           return const SizedBox();
  //         },
  //       ).toList(),
  //     ],
  //   );
  // }
}
