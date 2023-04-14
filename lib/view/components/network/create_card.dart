import 'package:blockchain/const/constant.dart';
import 'package:flutter/material.dart';

class CardFb1 extends StatelessWidget {
  final String text;

  final String subtitle;
  final Function() onPressed;

  const CardFb1(
      {required this.text,
      required this.subtitle,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 250,
        height: 230,
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Column(
          children: [
            const Icon(
              Icons.add_circle_outline,
              color: primaryColor,
              size: 56,
            ),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
