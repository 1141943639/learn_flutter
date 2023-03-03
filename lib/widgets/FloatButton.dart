import 'package:flutter/material.dart';

class FloatButton extends StatelessWidget {
  late String text;
  late VoidCallback onTap;

  FloatButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          margin: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 15)),
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(0, 87, 151, 1)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)))),
            child: Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ))
      ],
    );
  }
}
