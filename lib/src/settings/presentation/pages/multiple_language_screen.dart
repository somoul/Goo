import 'package:flutter/material.dart';

enum BestTutorSite { khmer, english, china, korea }

class MultipleLanguageScreen extends StatelessWidget {
  const MultipleLanguageScreen({Key? key}) : super(key: key);
  static const String routeName = '/multiple_language_screen';

  @override
  Widget build(BuildContext context) {
    BestTutorSite site = BestTutorSite.khmer;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "ភាសា",
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          StatefulBuilder(builder: (context, setStateLanguage) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0 * 2),
                  child: Text(
                    "ជ្រើសរើសភាសា",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setStateLanguage(() {
                      site = BestTutorSite.khmer;
                    });
                    // Navigator.pop(context, true);
                  },
                  leading: Image.asset(
                    "assets/icons/kh.png",
                    width: 50,
                  ),
                  title: const Text("Khmer"),
                  trailing: Radio(
                    focusColor: const Color(0xff3784F9),
                    hoverColor: const Color(0xff3784F9),
                    activeColor: const Color(0xff3784F9),
                    value: BestTutorSite.khmer,
                    groupValue: site,
                    onChanged: (BestTutorSite? value) {},
                    // onChanged: (BestTutorSite? value) {
                    //
                    //
                    // },
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    setStateLanguage(() {
                      site = BestTutorSite.english;
                    });
                    // Navigator.pop(context, true);
                  },
                  leading: Image.asset(
                    "assets/icons/english.png",
                    width: 50,
                  ),
                  title: const Text("English"),
                  trailing: Radio(
                    focusColor: const Color(0xff3784F9),
                    hoverColor: const Color(0xff3784F9),
                    activeColor: const Color(0xff3784F9),
                    value: BestTutorSite.english,
                    groupValue: site,
                    onChanged: (BestTutorSite? value) {
                      // setStateLanguage(() {
                      //   _site = value!;
                      // });
                      // Navigator.pop(context);
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    setStateLanguage(() {
                      site = BestTutorSite.china;
                    });
                    //  Navigator.pop(context, true);
                  },
                  leading: Image.asset(
                    "assets/icons/china.png",
                    width: 50,
                  ),
                  title: const Text("China"),
                  trailing: Radio(
                    focusColor: const Color(0xff3784F9),
                    hoverColor: const Color(0xff3784F9),
                    activeColor: const Color(0xff3784F9),
                    value: BestTutorSite.china,
                    groupValue: site,
                    onChanged: (BestTutorSite? value) {
                      setStateLanguage(() {
                        site = value!;
                      });
                      //  Navigator.pop(context, true);
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    setStateLanguage(() {
                      site = BestTutorSite.korea;
                    });
                    //   Navigator.pop(context, true);
                  },
                  leading: Image.asset(
                    "assets/icons/korea.png",
                    width: 50,
                  ),
                  title: const Text("Korea"),
                  trailing: Radio(
                    focusColor: const Color(0xff3784F9),
                    hoverColor: const Color(0xff3784F9),
                    activeColor: const Color(0xff3784F9),
                    value: BestTutorSite.korea,
                    groupValue: site,
                    onChanged: (BestTutorSite? value) {},
                  ),
                ),
                const Divider(),
              ],
            );
          }),
          Positioned(bottom: 0, child: Image.asset("assets/image2/logo3.png"))
        ],
      ),
    );
  }
}
