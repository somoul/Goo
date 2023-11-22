import 'package:flutter/material.dart';

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
              child: Text("History"),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Color(0xFF21A6F8)),
              backgroundColor: Colors.white,
              centerTitle: true,
              title: const Text(
                "បន្ទប់ជួល",

                //style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            ),
            body: const DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(100),
                  child: SizedBox(
                    height: 50,
                    child: TabBar(
                      indicatorColor: Colors.grey,
                      labelColor: Color(0xFF21A6F8),
                      unselectedLabelColor: Colors.grey,
                      indicator: UnderlineTabIndicator(
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
                    // RentingRoomPage(
                    //   checkAccount: checkAccount ?? "default",
                    // ),
                    // RentedRoomPage(
                    //   checkAccount: checkAccount ?? "default",
                    // )
                  ],
                ),
              ),
            ),
          );
    // return
  }
}
