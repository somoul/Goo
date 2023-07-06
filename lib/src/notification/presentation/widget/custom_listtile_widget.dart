import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TypeOfRent> listTypeOfRent = [
      const TypeOfRent(
          imageSrc: 'assets/image2/nofitication.png',
          typeName: "តើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលសម្រាប់រស់នៅមែនទេ?",
          sizeRent:
              "ប្រសិនបើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលដែលមានតម្លៃសមរម្យ........."),
      const TypeOfRent(
          imageSrc: 'assets/image2/nofitication.png',
          typeName: "តើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលសម្រាប់រស់នៅមែនទេ?",
          sizeRent:
              "ប្រសិនបើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលដែលមានតម្លៃសមរម្យ........."),
      const TypeOfRent(
          imageSrc: 'assets/image2/nofitication.png',
          typeName: "តើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលសម្រាប់រស់នៅមែនទេ?",
          sizeRent:
              "ប្រសិនបើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលដែលមានតម្លៃសមរម្យ........."),
      const TypeOfRent(
          imageSrc: 'assets/image2/nofitication.png',
          typeName: "តើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលសម្រាប់រស់នៅមែនទេ?",
          sizeRent:
              "ប្រសិនបើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលដែលមានតម្លៃសមរម្យ........."),
      const TypeOfRent(
          imageSrc: 'assets/image2/nofitication.png',
          typeName: "តើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលសម្រាប់រស់នៅមែនទេ?",
          sizeRent:
              "ប្រសិនបើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលដែលមានតម្លៃសមរម្យ........."),
      const TypeOfRent(
          imageSrc: 'assets/image2/nofitication.png',
          typeName: "តើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលសម្រាប់រស់នៅមែនទេ?",
          sizeRent:
              "ប្រសិនបើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលដែលមានតម្លៃសមរម្យ........."),
      const TypeOfRent(
          imageSrc: 'assets/image2/nofitication.png',
          typeName: "តើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលសម្រាប់រស់នៅមែនទេ?",
          sizeRent:
              "ប្រសិនបើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលដែលមានតម្លៃសមរម្យ........."),
      const TypeOfRent(
          imageSrc: 'assets/image2/nofitication.png',
          typeName: "តើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលសម្រាប់រស់នៅមែនទេ?",
          sizeRent:
              "ប្រសិនបើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលដែលមានតម្លៃសមរម្យ........."),
      const TypeOfRent(
          imageSrc: 'assets/image2/nofitication.png',
          typeName: "តើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលសម្រាប់រស់នៅមែនទេ?",
          sizeRent:
              "ប្រសិនបើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលដែលមានតម្លៃសមរម្យ........."),
      const TypeOfRent(
          imageSrc: 'assets/image2/nofitication.png',
          typeName: "តើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលសម្រាប់រស់នៅមែនទេ?",
          sizeRent:
              "ប្រសិនបើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលដែលមានតម្លៃសមរម្យ........."),
      const TypeOfRent(
          imageSrc: 'assets/image2/nofitication.png',
          typeName: "តើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលសម្រាប់រស់នៅមែនទេ?",
          sizeRent:
              "ប្រសិនបើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលដែលមានតម្លៃសមរម្យ........."),
      const TypeOfRent(
          imageSrc: 'assets/image2/nofitication.png',
          typeName: "តើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលសម្រាប់រស់នៅមែនទេ?",
          sizeRent:
              "ប្រសិនបើលោកអ្នកកំពុងស្វែងរកផ្ទះជួលដែលមានតម្លៃសមរម្យ........."),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...listTypeOfRent.map(
          (e) => ListTile(
            contentPadding: const EdgeInsets.all(0),
            // trailing: const Icon(
            //   Icons.arrow_forward_ios_sharp,
            //   size: 20,
            // ),
            leading: Image.asset(
              e.imageSrc,
              fit: BoxFit.cover,
            ),
            title: Row(
              children: [
                Flexible(
                  child: Text(
                    e.typeName,
                    overflow: TextOverflow.ellipsis,

                    // style: const TextStyle(
                    //     fontSize: 16, overflow: TextOverflow.ellipsis),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 18,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  width: 6,
                  height: 6,
                )
              ],
            ),
            subtitle: Text(
              e.sizeRent,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

class TypeOfRent {
  final String imageSrc;
  final String typeName;
  final String sizeRent;

  const TypeOfRent(
      {required this.imageSrc, required this.typeName, required this.sizeRent});
}

class CategoriesItem {
  final String iconSrc;
  final String iconName;

  const CategoriesItem({required this.iconName, required this.iconSrc});
}
