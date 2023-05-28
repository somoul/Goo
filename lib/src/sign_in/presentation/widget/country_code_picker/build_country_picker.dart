import 'package:flutter/material.dart';
import 'package:goo_rent/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import 'countries.dart';
import 'country.dart';

class BuildCountryPicker extends StatelessWidget {
  const BuildCountryPicker(
      {Key? key, required this.function, required this.country})
      : super(key: key);
  final Function(Country) function;
  final Country country;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        width: 115,
        padding: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey)),
        child: DropdownButton<Country>(
          value: country,
          elevation: 16,
          isExpanded: true,
          style: GoogleFonts.kantumruy(color: Colors.deepPurple),

          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (Country? countryCode) {
            function(countryCode!);
          },
          items: countryList.map<DropdownMenuItem<Country>>((Country value) {
            return DropdownMenuItem<Country>(
              value: value,
              child: _buildDefaultMenuItem(value),
            );
          }).toList(),
          // items: countryList.map((e){
          //   return DropdownMenuItem<Country>(child: Text("${e}"));
          // }).toList(),
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
        const SizedBox(
          width: 8.0,
        ),
        Text(
          "+${country.phoneCode}",
          style: GoogleFonts.kantumruy(fontSize: 14),
        ),
      ],
    ),
  );
}
