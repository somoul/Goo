import 'package:flutter/material.dart';
import 'package:goo_rent/src/sign_in/presentation/blog/countdown_otp_provider/countdown_otp_provider.dart';
import 'package:goo_rent/src/sign_in/presentation/widget/country_code_picker/build_country_picker.dart';
import 'package:goo_rent/src/sign_in/presentation/widget/country_code_picker/countries.dart';
import 'package:provider/provider.dart';

class SignOutScreen extends StatelessWidget {
  const SignOutScreen({Key? key}) : super(key: key);
  static const String routeName = '/sign_out_screen';

  @override
  Widget build(BuildContext context) {
    var countryCode = countryList[30];
    bool checkPhoneExisting = false;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: StatefulBuilder(builder: (context, setStateSignIn) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120,
                ),
                const Text(
                  "Enter your phone number",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
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
                const Spacer(),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                        onPressed: checkPhoneExisting
                            ? () {
                                context
                                    .read<OTPCountdownProvider>()
                                    .changeIndex(index: 59);
                                // GoRouter.of(context)
                                //     .push("/verification_otp_screen");
                              }
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
