import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_rent/src/sign_in/presentation/widget/country_code_picker/countries.dart';
import 'package:goo_rent/utils/validate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/country_code_picker/build_country_picker.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static const String routeName = '/sign_in_screen';

  @override
  Widget build(BuildContext context) {
    var countryCode = countryList[30];
    bool obSecText = true;
    bool checkPhoneExisting = false;
    bool checkPasswordExisting = false;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: StatefulBuilder(builder: (context, setStateSignIn) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120.h,
                ),
                Text(
                  "Welcome",
                  style: GoogleFonts.kantumruy(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Sign in your account to continues!",
                  style: GoogleFonts.kantumruy(fontSize: 18),

                  //style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    StatefulBuilder(builder: (context, setStateCountryCode) {
                      return BuildCountryPicker(
                          function: (c) {
                            setStateCountryCode(() {
                              countryCode = c;
                            });
                          },
                          country: countryCode);
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        maxLines: 1,
                        maxLength: 10,
                        onChanged: (c) {
                          if (c.length > 8) {
                            checkPhoneExisting = true;
                          } else {
                            checkPhoneExisting = false;
                          }
                          setStateSignIn(() {});
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            counterText: "",
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            hintText: "XXX-XXX-XXX",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Colors.grey))),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                StatefulBuilder(builder: (context, setStatePassword) {
                  return TextField(
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: obSecText,
                    obscuringCharacter: '*',
                    onChanged: (c) {
                      setStateSignIn(() {
                        checkPasswordExisting = validatePassword(c);
                      });
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(obSecText
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setStatePassword(() {
                              obSecText = !obSecText;
                            });
                          },
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        hintStyle: GoogleFonts.kantumruy(),
                        hintText: "Please create password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(color: Colors.grey),
                        )),
                  );
                }),
                const Spacer(),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                        onPressed: checkPhoneExisting && checkPasswordExisting
                            ? () {}
                            : null,
                        child: const Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )))
              ],
            );
          }),
        ),
      ),
    );
  }
}
