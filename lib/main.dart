import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practice/animations/hero_animations/hero_test.dart';

import 'package:practice/clean_archi_tdd_number_trivia/core/dependency_injection/service_locator.dart';

import 'package:practice/getx/getTest.dart';
import 'package:practice/theming/custom_theme.dart';
import 'package:practice/theming/theme_bloc/theme_bloc.dart';
import 'package:practice/theming/theme_test.dart';
import 'dart:developer' as devtools show log;

import 'theming/theme_bloc/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

extension Log on Object {
  void log() => devtools.log(toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeBloc())],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return GetMaterialApp(
            title: 'Go-router',
            theme: state is ThemeLight ? state.themeData : lightTheme,
            darkTheme: state is ThemeDark ? state.themeData : darkTheme,
            themeMode: state is ThemeLight ? ThemeMode.light : ThemeMode.dark,
            initialBinding: StoreBinding(),
            // routerConfig: _router,
            home: const HeroAnimations(),
          );
        },
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
  @override
  Widget build(BuildContext context) {
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
