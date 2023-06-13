import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/utils/utils.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/countries.dart';

import 'country.dart';

class BuildCountryPicker extends StatelessWidget {
  const BuildCountryPicker({
    Key? key,
    required this.onSelected,
    required this.initCountry,
  }) : super(key: key);
  final Function(Country) onSelected;
  final Country initCountry;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        width: 115,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey)),
        child: DropdownButton<Country>(
          icon: const Icon(Icons.arrow_drop_down_rounded),
          value: initCountry,
          // elevation: 16,
          isExpanded: true,
          style: AppText.bodyMedium,
          // underline: Container(
          //   // height: 2,
          //   color: Colors.deepPurpleAccent,
          // ),
          onChanged: (Country? countryCode) {
            onSelected(countryCode!);
          },
          items: countryList.map<DropdownMenuItem<Country>>((Country value) {
            return DropdownMenuItem<Country>(
              value: value,
              child: _buildDefaultMenuItem(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

Widget _buildDefaultMenuItem(Country country) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        const Spacer(),
        Text("+${country.phoneCode}", style: AppText.titleSmall),
      ],
    ),
  );
}
