import 'package:flutter/material.dart';

class HeroSecondScreen extends StatefulWidget {
  const HeroSecondScreen({super.key});

  @override
  State<HeroSecondScreen> createState() => _HeroSecondScreenState();
}

class _HeroSecondScreenState extends State<HeroSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('second screen'),
      ),
      body: Column(
        children: [
          Hero(
              tag: 'messi',
              child: CircleAvatar(
                child: Image.asset('assets/images/messileo.jpg'),
              ))
        ],
      ),
    );
  }
}
