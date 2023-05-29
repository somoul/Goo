import 'package:flutter/widgets.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/countries.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/country.dart';

class CountryPickerUtils {
  static Country getCountryByIso3Code(String iso3Code) {
    try {
      return countryList.firstWhere(
        (country) => country.iso3Code.toLowerCase() == iso3Code.toLowerCase(),
      );
    } catch (error) {
      throw Exception(
          "The initialValue provided is not a supported iso 3 code!");
    }
  }

  static Country getCountryByIsoCode(String isoCode) {
    try {
      return countryList.firstWhere(
        (country) => country.isoCode.toLowerCase() == isoCode.toLowerCase(),
      );
    } catch (error) {
      throw Exception("The initialValue provided is not a supported iso code!");
    }
  }

  static Country getCountryByName(String name) {
    try {
      return countryList.firstWhere(
        (country) => country.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (error) {
      throw Exception("The initialValue provided is not a supported name!");
    }
  }

  static String getFlagImageAssetPath(String isoCode) {
    return "assets/flags/${isoCode.toLowerCase()}.png";
  }

  static Widget getDefaultFlagImage(Country country) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.asset(
        CountryPickerUtils.getFlagImageAssetPath(country.isoCode),
        height: 25.0,
        width: 25.0,
        fit: BoxFit.fill,
        // package: "country_pickers",
      ),
    );
  }

  static Country getCountryByPhoneCode(String phoneCode) {
    try {
      return countryList.firstWhere(
        (country) => country.phoneCode.toLowerCase() == phoneCode.toLowerCase(),
      );
    } catch (error) {
      throw Exception(
          "The initialValue provided is not a supported phone code!");
    }
  }
}
