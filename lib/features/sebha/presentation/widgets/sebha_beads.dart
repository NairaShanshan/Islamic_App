import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/utils/app_colors.dart';

class BeadsArcWidget extends StatelessWidget {
  final int counter;
  const BeadsArcWidget({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const double beadSize = 38.0;
    const double spacing = 45.0; // المسافة بين الخرز

    return SizedBox(
      height: 150,
      width: screenWidth,
      child: Stack(
        alignment: Alignment.center,
        children: List.generate(33, (index) {
          double relativePos = (index - counter).toDouble();

          return AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            right: (screenWidth / 2 - (beadSize / 2)) + (relativePos * spacing),
            top: 20 + (pow(relativePos, 2) * 2.5),

            child: _buildBead(index == counter),
          );
        }),
      ),
    );
  }

  Widget _buildBead(bool isActive) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            isActive ? Colors.white :  AppColors.brownColor,
             AppColors.brownColor,
          ],
          center: const Alignment(-0.3, -0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(2, 4),
          )
        ],
      ),
    );
  }
}