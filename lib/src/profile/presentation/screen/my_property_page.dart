import 'package:flutter/material.dart';
import 'package:goo_rent/src/profile/presentation/screen/rented_room.dart';
import 'package:goo_rent/src/profile/presentation/screen/renting_room.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPropertyPage extends StatelessWidget {
  static const String routeName = '/my_property_page';
  final String? checkAccount;

  const MyPropertyPage(
      {Key? key, required this.checkAccount, required this.isMantenance})
      : super(key: key);
  final bool isMantenance;

  @override
  Widget build(BuildContext context) {
    return isMantenance
        ? const Scaffold(
            body: Center(
              child: Text("Maintenance Page"),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Color(0xFF21A6F8)),
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                "បន្ទប់ជួល",
                style: GoogleFonts.kantumruy(fontSize: 22, color: Colors.black),
                //style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            ),
            body: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(100),
                  child: SizedBox(
                    height: 50,
                    child: TabBar(
                      indicatorColor: Colors.grey,
                      labelColor: const Color(0xFF21A6F8),
                      unselectedLabelColor: Colors.grey,
                      indicator: const UnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 2.0, color: Color(0xFF21A6F8)),
                        // insets: EdgeInsets.symmetric(horizontal: 36)
                      ),
                      tabs: [
                        Tab(
                          // text: "ទូទៅ",
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(Icons.add),
                              Text(
                                'ទូទៅ',
                                style: GoogleFonts.kantumruy(fontSize: 16),
                                //style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          // text: "ទូទៅ",
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(Icons.add),
                              Text(
                                'កំពុងដាក់ជួល',
                                style: GoogleFonts.kantumruy(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    RentingRoomPage(
                      checkAccount: checkAccount ?? "default",
                    ),
                    RentedRoomPage(
                      checkAccount: checkAccount ?? "default",
                    )
                  ],
                ),
              ),
            ),
          );
    // return
  }
}
