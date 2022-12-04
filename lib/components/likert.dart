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
      this.width = 35,
      this.height = 35});

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
                shadows: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 1,
                    color: AppColors.black.withOpacity(0.3),
                  ),
                ],
                shape: CircleBorder(),
                gradient: this.grad,
              ),
              child: Center(
                child: Container(
                    height: this.height - 8,
                    width: this.width - 8,
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: AppColors.white),
                    child: Center(
                        child: Container(
                      height: this.height - 16,
                      width: this.width - 16,
                      decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          gradient: value == groupValue
                              ? this.grad
                              : LinearGradient(
                                  colors: [AppColors.white, AppColors.white])),
                    ))),
              ))),
    );
  }
}
