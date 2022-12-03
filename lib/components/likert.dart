import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';

class LikertScaleButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final LinearGradient grad;
  final double width;
  final double height;

  LikertScaleButton(
      {required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.grad,
      this.width = 32,
      this.height = 32});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: () {
            onChanged(this.value);
          },
          child: Container(
              height: this.height,
              width: this.width,
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                gradient: this.grad,
              ),
              child: Center(
                child: Container(
                    height: this.height - 8,
                    width: this.width - 8,
                    decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        gradient: value == groupValue
                            ? this.grad
                            : LinearGradient(
                                colors: [AppColors.bg, AppColors.bg]))),
              ))),
    );
  }
}

// Widget likertScale() {
//   return Row(
//     children: [
//       likertScaleButton(AppGrads.lowest),
//       likertScaleButton(AppGrads.secondLowest),
//       likertScaleButton(AppGrads.medium),
//       likertScaleButton(AppGrads.secondHighest),
//       likertScaleButton(AppGrads.highest),
//     ],
//   );
// }

// Widget likertScaleButton(Gradient grad) {
//   return Stack(
//     alignment: Alignment.center,
//     children: [
//       Container(
//         height: 40,
//         width: 40,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           gradient: grad,
//         ),
//       ),
//       Container(
//         height: 30,
//         width: 30,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: AppColors.bg,
//         ),
//       ),
//     ],
//   );
// }
