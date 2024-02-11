import 'package:flutter/material.dart';
import 'package:goo_rent/helper/image_builder.dart';

class RadioButton extends StatelessWidget {
  final double size;
  final bool value;
  final bool ignorePointer;

  const RadioButton({
    super.key,
    required this.value,
    this.size = 22,
    this.ignorePointer = true,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignorePointer,
      child: SizedBox(
        height: size + 6,
        width: size + 6,
        child: Center(
          child: Builder(
            builder: (_) {
              if (value) {
                return ImageBuilder().asset('assets/image2/check.svg');
                // return const Icon(Icons.check_circle,
                //     color: AppConstant.kPrimaryColor);
              } else {
                return ImageBuilder(color: Colors.grey)
                    .asset('assets/image2/check.svg');
              }
            },
          ),
        ),
      ),
    );
  }
}
