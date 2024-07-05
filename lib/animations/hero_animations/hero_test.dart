import 'package:flutter/material.dart';
import 'package:practice/animations/hero_animations/second_screen.dart';

class HeroAnimations extends StatefulWidget {
  const HeroAnimations({super.key});

  @override
  State<HeroAnimations> createState() => _HeroAnimationsState();
}

class _HeroAnimationsState extends State<HeroAnimations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(tag: 'messi', child: Image.asset('assets/images/messileo.jpg')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HeroSecondScreen()));
            },
            child: const Text('GO TO'),
          )
        ],
      ),
    );
  }
}
