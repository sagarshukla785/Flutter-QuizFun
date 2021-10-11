import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizfun/controllers/quiz/quiz_controller.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback tap;
  const CustomButton({
    Key? key,
    required this.title,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        color: Colors.yellow,
        child: Container(
          margin: EdgeInsets.all(20),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(100),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
