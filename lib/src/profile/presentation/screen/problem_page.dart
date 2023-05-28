import 'package:flutter/material.dart';

class ProblemPage extends StatelessWidget {
  static const String routeName = '/problem_pages';

  const ProblemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: const Text(
          "ដំណោះស្រាយជូនអ្នក",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 8.0 * 2).copyWith(top: 16),
        child: Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              leading: Image.asset(
                'assets/icons/customer.png',
                height: 30,
              ),
              title: const Text(
                "Customer Service",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              leading: Image.asset(
                'assets/icons/whatsapp.png',
                height: 30,
              ),
              title: const Text(
                "WhatsApp",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              leading: Image.asset(
                'assets/icons/website.png',
                height: 30,
              ),
              title: const Text(
                "Website",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              leading: Image.asset(
                'assets/icons/facebook.png',
                height: 30,
              ),
              title: const Text(
                "Facebook",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              leading: Image.asset(
                'assets/icons/Twitter.png',
                height: 30,
              ),
              title: const Text(
                "Twitter",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              leading: Image.asset(
                'assets/icons/Instagram.png',
                height: 30,
              ),
              title: const Text(
                "Instagram",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
