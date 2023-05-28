import 'package:flutter/material.dart';
import 'package:goo_rent/src/home/presentation/screen/products/product_tap_view/data.dart';
import 'package:goo_rent/src/home/presentation/widget/custom_card_rent_widget.dart';

class GorentHotelScreen extends StatelessWidget {
  const GorentHotelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TypeOfRent> listTypeOfRent = [
      const TypeOfRent(
          imageSrc: 'assets/images/avengers.jpeg',
          typeName: "បន្ទប់គ្រែពីរ",
          location: "ទំហំ ៖ ៤ គុណ ៨ ម៉ែត្រការេ",
          priceOfRent: "១២០ ដុល្លា/១ខែ",
          sizeRent: 'នៅបាន៤អ្នក'),
      const TypeOfRent(
          imageSrc: 'assets/images/avengers.jpeg',
          typeName: "បន្ទប់គ្រែពីរ",
          location: "ទំហំ ៖ ៤ គុណ ៨ ម៉ែត្រការេ",
          priceOfRent: "១២០ ដុល្លា/១ខែ",
          sizeRent: 'នៅបាន៤អ្នក'),
      const TypeOfRent(
          imageSrc: 'assets/images/avengers.jpeg',
          typeName: "បន្ទប់គ្រែពីរ",
          location: "ទំហំ ៖ ៤ គុណ ៨ ម៉ែត្រការេ",
          priceOfRent: "១២០ ដុល្លា/១ខែ",
          sizeRent: 'នៅបាន៤អ្នក'),
      const TypeOfRent(
          imageSrc: 'assets/images/avengers.jpeg',
          typeName: "បន្ទប់គ្រែពីរ",
          location: "ទំហំ ៖ ៤ គុណ ៨ ម៉ែត្រការេ",
          priceOfRent: "១២០ ដុល្លា/១ខែ",
          sizeRent: 'នៅបាន៤អ្នក'),
      const TypeOfRent(
          imageSrc: 'assets/images/avengers.jpeg',
          typeName: "បន្ទប់គ្រែពីរ",
          location: "ទំហំ ៖ ៤ គុណ ៨ ម៉ែត្រការេ",
          priceOfRent: "១២០ ដុល្លា/១ខែ",
          sizeRent: 'នៅបាន៤អ្នក'),
      const TypeOfRent(
          imageSrc: 'assets/images/avengers.jpeg',
          typeName: "បន្ទប់គ្រែពីរ",
          location: "ទំហំ ៖ ៤ គុណ ៨ ម៉ែត្រការេ",
          priceOfRent: "១២០ ដុល្លា/១ខែ",
          sizeRent: 'នៅបាន៤អ្នក'),
      const TypeOfRent(
          imageSrc: 'assets/images/avengers.jpeg',
          typeName: "បន្ទប់គ្រែពីរ",
          location: "ទំហំ ៖ ៤ គុណ ៨ ម៉ែត្រការេ",
          priceOfRent: "១២០ ដុល្លា/១ខែ",
          sizeRent: 'នៅបាន៤អ្នក'),
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "អាផាតមិនជួល",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ...listTypeOfRent.map(
              (e) => CustomCardRentWidget(
                imageSrc: e.imageSrc,
                typeName: e.typeName,
                location: e.location,
                sizeRent: e.sizeRent,
                priceOfRent: e.priceOfRent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
