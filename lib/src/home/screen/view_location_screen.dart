import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';

class ViewLocationScreen extends StatelessWidget {
  const ViewLocationScreen({Key? key}) : super(key: key);
  static const String routeName = '/view_location_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          "ស្វែងរកទីតាំង",
          // style: GoogleFonts.kantumruy(fontSize: 18),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/map.webp',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 150,
                color: Colors.white,
              )
            ],
          ),
          Positioned(
              bottom: 20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      width: 40,
                      height: 40,
                      child: SvgPicture.asset("assets/image2/Vector.svg"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: AppConstant.padding),
                      child: Padding(
                        padding: const EdgeInsets.all(AppConstant.padding),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircleAvatar(
                                        backgroundColor: const Color(0xFF0075FD)
                                            .withOpacity(0.2),
                                        radius: 20,
                                        child: SvgPicture.asset(
                                          'assets/icons/location.svg',
                                          width: 15,
                                          height: 15,
                                          color: const Color(0xFF0075FD),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(height: 50, child: VerticalDivider(
                                    //   width: 2,
                                    //   thickness: 3,
                                    // )),
                                    const SizedBox(
                                      height: 37,
                                      child: CustomPaint(
                                        painter: LinePainter(
                                          color: Color(0xFF0075FD),
                                          firstOffset: Offset(0, 40),
                                          secondOffset: Offset(0, 0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),

                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircleAvatar(
                                        backgroundColor: const Color(0xFF0075FD)
                                            .withOpacity(0.2),
                                        radius: 20,
                                        child: SvgPicture.asset(
                                          'assets/icons/location.svg',
                                          width: 15,
                                          height: 15,
                                          color: const Color(0xFF0075FD),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ទីតាំងរបស់អ្នក",
                                      // style: GoogleFonts.kantumruy(
                                      //     color: Colors.grey),
                                    ),
                                    Text(
                                      "Royal University",
                                    ),
                                    Text(
                                      "ទីតាំងផ្ទះ",
                                      // style: GoogleFonts.kantumruy(
                                      //     color: Colors.grey),
                                    ),
                                    Text(
                                      "Khan sen sok,Street 12, Phnom Penh",
                                      // style: GoogleFonts.kantumruy(
                                      //     color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "ទៅកាន់ផ្ទះ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              onPressed: () {
                                // GoRouter.of(context).pop();
                              },
                              child: const Text(
                                "រក្សាអាស្រាយដ្ធានរបស់អ្នក",
                                // style: GoogleFonts.kantumruy(
                                //     color: Colors.white, fontSize: 16),
                              ))),
                    )
                  ],
                ),
              )),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0)
                  .copyWith(left: 16, right: 16),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    fillColor: Colors.white.withOpacity(0.8),
                    filled: true,
                    hintText: "ស្វែងរកទីតាំង",
                    prefixIcon: const Icon(
                      Icons.search_outlined,
                      color: Colors.grey,
                      size: 28,
                    ),
                    errorBorder: _getDecoreOutLineBorderTextField(),
                    focusedBorder: _getDecoreOutLineBorderTextField(),
                    focusedErrorBorder: _getDecoreOutLineBorderTextField(),
                    disabledBorder: _getDecoreOutLineBorderTextField(),
                    enabledBorder: _getDecoreOutLineBorderTextField(),
                    border: _getDecoreOutLineBorderTextField(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final Offset firstOffset;
  final Offset secondOffset;
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double dashSpace;

  const LinePainter({
    required this.firstOffset,
    required this.secondOffset,
    this.color = Colors.black,
    this.strokeWidth = 2.0,
    this.dashLength = 4.0,
    this.dashSpace = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;
    _drawDashedLine(
        dashLength, dashSpace, firstOffset, secondOffset, canvas, size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _drawDashedLine(double dashLength, double dashSpace, Offset firstOffset,
      Offset secondOffset, Canvas canvas, Size size, Paint paint) {
    var startOffset = firstOffset;

    var intervals = _getDirectionVector(firstOffset, secondOffset).length /
        (dashLength + dashSpace);

    for (var i = 0; i < intervals; i++) {
      var endOffset = _getNextOffset(startOffset, secondOffset, dashLength);

      /// Draw a small line.
      canvas.drawLine(startOffset, endOffset, paint);

      /// Update the starting offset.
      startOffset = _getNextOffset(endOffset, secondOffset, dashSpace);
    }
  }

  Offset _getNextOffset(
    Offset firstOffset,
    Offset secondOffset,
    double smallVectorLength,
  ) {
    var directionVector = _getDirectionVector(firstOffset, secondOffset);

    var rescaleFactor = smallVectorLength / directionVector.length;
    if (rescaleFactor.isNaN || rescaleFactor.isInfinite) {
      rescaleFactor = 1;
    }

    var rescaledVector = Offset(directionVector.vector.dx * rescaleFactor,
        directionVector.vector.dy * rescaleFactor);

    var newOffset = Offset(
        firstOffset.dx + rescaledVector.dx, firstOffset.dy + rescaledVector.dy);

    return newOffset;
  }

  DirectionVector _getDirectionVector(Offset firstVector, Offset secondVector) {
    var directionVector = Offset(
        secondVector.dx - firstVector.dx, secondVector.dy - firstVector.dy);

    var directionVectorLength =
        sqrt(pow(directionVector.dx, 2) + pow(directionVector.dy, 2));

    return DirectionVector(
      vector: directionVector,
      length: directionVectorLength,
    );
  }
}

class DirectionVector {
  final Offset vector;
  final double length;

  const DirectionVector({
    required this.vector,
    required this.length,
  });
}

_getDecoreOutLineBorderTextField() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide.none,
  );
}
