import 'package:flutter/material.dart';

import '../constant/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    return SizedBox(
      height: 60,
      width: width / 3,
      child: ElevatedButton(
          onPressed: onPressed,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              text,
              style: const TextStyle(
                color: white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                fontFamily: 'ACaslonPro Bold',
              ),
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: teal1),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
          )),
    );
  }
}
