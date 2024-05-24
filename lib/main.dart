import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:practice/bloc/homepage.dart';
import 'package:practice/getx/getTest.dart';
import 'package:practice/solid_principles/singleton_pattern/debug_logger.dart';

void main() {
  runApp(const MyApp());
}

// final GoRouter _router = GoRouter(routes: [
//   GoRoute(path: "/", builder: (context, state) => const CounterApp()),
//   GoRoute(path: "/settings", builder: (context, state) => const SettingsPage())
// ]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Go-router',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: StoreBinding(),
      // routerConfig: _router,
      home: BlocProvider(
        create: (_) => PersonBloc(),
        child: const HomePage(),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final logger = DebugLogger();

  @override
  Widget build(BuildContext context) {
    logger.log('my name is natty,App just started');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice App'),
      ),
      body: const Center(
        child: Text('Natty'),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}
