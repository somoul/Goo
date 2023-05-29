import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_rent/src/splash/presentation/widgets/show_dialog_ocation.dart';

class CreateNameScreen extends StatelessWidget {
  const CreateNameScreen({Key? key}) : super(key: key);
  static const String routeName = '/create_name_screen';

  @override
  Widget build(BuildContext context) {
    bool checkPasswordExisting = false;
    bool obSecText = false;
    TextEditingController txtName = TextEditingController();
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
                const Text(
                  "What is your name?",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                StatefulBuilder(builder: (context, setStatePassword) {
                  return TextField(
                    controller: txtName,
                    enableSuggestions: false,
                    autocorrect: false,
                    onChanged: (c) {
                      if (c.isNotEmpty) {
                        obSecText = true;
                        if (c.length > 3) {
                          checkPasswordExisting = true;
                        } else {
                          checkPasswordExisting = false;
                        }
                      } else {
                        obSecText = false;
                      }

                      setStateSignIn(() {});
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(obSecText ? Icons.cancel : null),
                          onPressed: obSecText
                              ? () {
                                  txtName.clear();
                                }
                              : null,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        hintText: "Please enter your name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(color: Colors.black),
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
                        onPressed: checkPasswordExisting
                            ? () {
                                showAlertDialog(context: context);
                              }
                            : null,
                        child: const Text(
                          "Confirm",
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
