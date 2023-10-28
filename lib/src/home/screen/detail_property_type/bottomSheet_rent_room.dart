import 'package:flutter/material.dart';

Future showBottomSubmitforRent(BuildContext context) async {
  var result = showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
            decoration: const BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: const ContainSubmitForRent()),
      );
    },
  );
}

class ContainSubmitForRent extends StatelessWidget {
  const ContainSubmitForRent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Text("ការស្នើសុំជួល"),
          Row(
            children: [
              Container(
                  height: 113,
                  width: 146,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://media.istockphoto.com/id/479767332/photo/idyllic-home-with-covered-porch.webp?b=1&s=170667a&w=0&k=20&c=8WsZVz6uBs31BhBJ0xzTFgbBixVyG0biRGftge7nfe4=")))),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("បន្ទប់ជួលផ្សាឈូកមាស តម្លៃល្អ "),
                  Row(
                    children: [
                      // Image.asset(""),
                      Text("លេខកូដ"),
                      Text("AIB89"),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
