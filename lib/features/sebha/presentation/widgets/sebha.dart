import 'package:flutter/material.dart';

class SebhaBeads extends StatelessWidget {
  final int count;

  const SebhaBeads({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 33,
        itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.all(4),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index < count
                  ? Colors.brown
                  : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}