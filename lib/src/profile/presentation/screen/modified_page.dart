import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedPage extends StatefulWidget {
  static const String routeName = '/modified_page';

  const ModifiedPage({Key? key, required this.modifyField}) : super(key: key);
  final ModifyField modifyField;

  @override
  State<ModifiedPage> createState() => _ModifiedPageState();
}

class _ModifiedPageState extends State<ModifiedPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController =
        TextEditingController(text: widget.modifyField.textField);
  }

  late final TextEditingController _textEditingController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          widget.modifyField.appBarTitle,
          style: GoogleFonts.kantumruy(fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0*2),
          //   child: StatefulBuilder(builder: (context, setStatePassword) {
          //     return TextField(
          //       controller: txtName,
          //       enableSuggestions: false,
          //       autocorrect: false,
          //       onChanged: (c) {
          //         if (c.isNotEmpty) {
          //           obSecText = true;
          //           if (c.length > 3) {
          //             checkPasswordExisting = true;
          //           } else {
          //             checkPasswordExisting = false;
          //           }
          //         } else {
          //           obSecText = false;
          //         }
          //
          //         setStateSignIn(() {});
          //       },
          //       decoration: InputDecoration(
          //           suffixIcon: IconButton(
          //             icon: Icon(obSecText ? Icons.cancel : null),
          //             onPressed: obSecText
          //                 ? () {
          //               txtName.clear();
          //             }
          //                 : null,
          //           ),
          //           contentPadding: const EdgeInsets.symmetric(
          //               horizontal: 10, vertical: 15),
          //           hintText: "Please enter your name",
          //           border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(7),
          //             borderSide: const BorderSide(color: Colors.black),
          //           )),
          //     );
          //   }),
          // ),

          Padding(
            padding: const EdgeInsets.all(8.0 * 2),
            child: TextField(
              style: GoogleFonts.kantumruy(),
              controller: _textEditingController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    ("assets/image2/closecircle.svg"),
                  ),
                  onPressed: () {},
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                fillColor: Colors.grey[200],
                filled: true,
                border: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF21A6F8))),
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 8.0 * 2),
              child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: null,
                      child: Text(
                        "រក្សាទុក",
                        style: GoogleFonts.kantumruy(
                            color: Colors.white, fontSize: 18),
                      ))),
            ),
          )
        ],
      ),
    );
  }
}

class ModifyField {
  final String appBarTitle;
  final String textField;

  const ModifyField({required this.appBarTitle, required this.textField});
}
