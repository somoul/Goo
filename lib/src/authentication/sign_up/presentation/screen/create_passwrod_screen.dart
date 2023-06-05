import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/custom_button.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';

import 'create_name_screen.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);
  static const String routeName = '/create_password_screen';

  @override
  Widget build(BuildContext context) {
    bool obSecText = true;

    return GestureDetector(
      onTap: () => KeyboardHeper.hideKeyborad(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: StatefulBuilder(builder: (context, setStateSignIn) {
            return Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 120.h,
                      ),
                      const Text(
                        "Create a new password",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      StatefulBuilder(builder: (context, setStatePassword) {
                        return TextField(
                          // cursorColor: Colors.red[600],
                          enableSuggestions: false,
                          autocorrect: false,
                          obscureText: obSecText,
                          obscuringCharacter: '*',
                          onChanged: (c) {
                            setStateSignIn(() {
                              // checkPasswordExisting = validatePassword(c);
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
                              hintText: "Please create password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              )),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: CustomButton(
                    title: 'Confirm',
                    onPressed: () {
                      Get.to(() => const CreateNameScreen());
                    },
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
