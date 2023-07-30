// import 'dart:math' as math;

// import 'package:flutter/material.dart';

// class MyTab extends StatelessWidget {
//   final Color backgroundColor;
//   final Color foregroundColor;
//   final Color activeBackgroundColor;
//   final Color activeForegroundColor;
//   final double fontSize;
//   final bool active;
//   final bool reversed;
//   final String label;
//   final VoidCallback onTap;

//   Color get bgColor =>
//       active ? activeBackgroundColor ?? foregroundColor : backgroundColor;
//   Color get fgColor =>
//       active ? activeForegroundColor ?? backgroundColor : foregroundColor;

//   const MyTab({
//     required Key key,
//     required this.active,
//     this.reversed = false,
//     required this.label,
//     required this.backgroundColor,
//     required this.foregroundColor,
//     required this.activeBackgroundColor,
//     required this.activeForegroundColor,
//     required this.fontSize,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: IgnorePointer(
//             child: reversed
//                 ? Transform(
//                     alignment: Alignment.center,
//                     transform: Matrix4.rotationY(math.pi),
//                     child: CustomPaint(painter: TabPainter(color: bgColor)),
//                   )
//                 : CustomPaint(painter: TabPainter(color: bgColor)),
//           ),
//         ),
//         Align(
//           alignment: reversed ? Alignment.centerRight : Alignment.centerLeft,
//           child: FractionallySizedBox(
//             widthFactor: .5,
//             heightFactor: 1,
//             child: TextButton(
//               onPressed: active ? null : onTap,
//               child: Text(
//                 label,
//                 style: TextStyle(color: fgColor, fontSize: fontSize),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class TabPainter extends CustomPainter {
//   final Color color;

//   TabPainter({required this.color});

//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill;

//     var path = Path();

//     path.moveTo(0, size.height);
//     path.lineTo(0, .5 * size.height);
//     path.quadraticBezierTo(0, 0, .1 * size.width, 0);
//     path.lineTo(.48 * size.width, 0);
//     path.quadraticBezierTo(
//         .512 * size.width, 0, .52 * size.width, .1 * size.height);
//     path.lineTo(.57 * size.width, .83 * size.height);
//     path.quadraticBezierTo(
//         .58 * size.width, .9 * size.height, .59 * size.width, .9 * size.height);
//     path.lineTo(size.width, .9 * size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const kPageTitle = 'Settings';
const kLabels = ["Edit Profile", "Accounts"];
const kTabBgColor = Color(0xFF8F32A9);
const kTabFgColor = Colors.white;

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends HookWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 2);
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageTitle),
        elevation: 0,
      ),
      body: Column(
        children: [
          MyTabBar(
            controller: controller,
            labels: kLabels,
            backgroundColor: kTabBgColor,
            foregroundColor: kTabFgColor,
            fontSize: 20,
            activeForegroundColor: Colors.red,
            activeBackgroundColor: Colors.yellow,
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                Center(child: Text(kLabels[0])),
                Center(child: Text(kLabels[1])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyTabBar extends HookWidget {
  final TabController controller;
  final List<String> labels;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color activeBackgroundColor;
  final Color activeForegroundColor;
  final double fontSize;

  const MyTabBar({
    Key? key,
    required this.controller,
    required this.labels,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.activeBackgroundColor,
    required this.activeForegroundColor,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ids = useState([1, 0]);
    return AspectRatio(
      aspectRatio: 100 / 18,
      child: ColoredBox(
        color: Theme.of(context).primaryColor,
        child: Stack(
          fit: StackFit.expand,
          children: ids.value.map((id) {
            final active = controller.index == id;
            return MyTab(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                activeBackgroundColor: activeBackgroundColor,
                activeForegroundColor: activeForegroundColor,
                fontSize: fontSize,
                active: active,
                reversed: id == 1,
                label: labels[id],
                onTap: () {
                  controller.animateTo(id);
                  ids.value = ids.value.reversed.toList();
                });
          }).toList(),
        ),
      ),
    );
  }
}

class MyTab extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color activeBackgroundColor;
  final Color activeForegroundColor;
  final double fontSize;
  final bool active;
  final bool reversed;
  final String label;
  final VoidCallback onTap;

  Color get bgColor =>
      active ? activeBackgroundColor ?? foregroundColor : backgroundColor;
  Color get fgColor =>
      active ? activeForegroundColor ?? backgroundColor : foregroundColor;

  const MyTab({
    Key? key,
    required this.active,
    this.reversed = false,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.activeBackgroundColor,
    required this.activeForegroundColor,
    required this.fontSize,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: IgnorePointer(
            child: reversed
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: CustomPaint(painter: TabPainter(color: Colors.red)),
                  )
                : CustomPaint(painter: TabPainter(color: bgColor)),
          ),
        ),
        Align(
          alignment: reversed ? Alignment.centerRight : Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: .5,
            heightFactor: 1,
            child: TextButton(
              onPressed: active ? null : onTap,
              child: Text(
                label,
                style: TextStyle(color: fgColor, fontSize: fontSize),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TabPainter extends CustomPainter {
  final Color color;

  TabPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, 0);
    path.quadraticBezierTo(0, 0, .1 * size.width, 0);
    path.lineTo(.40 * size.width, -50);
    path.quadraticBezierTo(
      .510 * size.width,
      0,
      .51 * size.width,
      .1 * size.height,
    );
    path.lineTo(.57 * size.width, .83 * size.height);
    path.quadraticBezierTo(
        .58 * size.width, .9 * size.height, .59 * size.width, .9 * size.height);
    path.lineTo(size.width, .9 * size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
