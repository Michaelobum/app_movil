import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Button extends StatelessWidget {
  // final String title;
  final IconData icon;
  final VoidCallback onClick;

  const Button(this.icon, this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color.fromRGBO(255, 82, 82, 1)),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(16)),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        onPressed: onClick,
        child: Row(
          children: [Icon(icon, size: 35)],
        ),
      ),
    );
  }
}
