import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Liskov extends StatelessWidget {
  const Liskov({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            drawUiButton(RoundedButton(color: Colors.green), 'Round'),
            const SizedBox(
              height: 20,
            ),
            drawUiButton(COutlinedButton(), 'Outlined'),
          ],
        ),
      ),
    );
  }
}

Widget drawUiButton(Button button, String label) {
  return button.buildButton(label: label);
}

abstract class Button {
  Widget buildButton({required String label});
}

class RoundedButton extends Button {
  Color color;
  RoundedButton({required this.color});
  @override
  Widget buildButton({required String label}) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(label));
  }
}

class COutlinedButton extends Button {
  @override
  Widget buildButton({required String label}) {
    return OutlinedButton(
      onPressed: () {},
      child: const Text('Outline Button'),
    );
  }
}
