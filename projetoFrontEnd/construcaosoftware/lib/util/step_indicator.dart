import 'package:construcaosoftware/util/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class StepsIndicator extends StatelessWidget {
  final int count;
  final int current;
  final double size;

  const StepsIndicator({Key? key, 
    required this.current,
    required this.count,
    this.size = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: FAProgressBar(
            currentValue: (current.toDouble() / count * 100).toDouble(),
            borderRadius: BorderRadius.circular(11),
            size: size,
            progressColor: AppColors.primary,
            backgroundColor: AppColors.border,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              count + 1,
              (index) {
                if (index == 0 || index == count) return Container();
                return Container(
                  width: size + 4,
                  height: size + 4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      width: 2,
                      color:
                          index <= current ? AppColors.primary : AppColors.hint,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
