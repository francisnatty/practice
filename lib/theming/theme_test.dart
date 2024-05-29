import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/theming/custom_theme.dart';
import 'package:practice/theming/theme_bloc/theme_bloc.dart';
import 'package:practice/theming/theme_bloc/theme_event.dart';

import 'theme_bloc/theme_state.dart';

class ThemeTestScreen extends StatefulWidget {
  const ThemeTestScreen({super.key});

  @override
  State<ThemeTestScreen> createState() => _ThemeTestScreenState();
}

class _ThemeTestScreenState extends State<ThemeTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
            if (state is ThemeLight) {
              return const Text('Light Mode');
            } else {
              return const Text('Dark Mode');
            }
          }),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text('Switch to dark mode'),
                    const Spacer(),
                    Switch(
                        value: context.read<ThemeBloc>().state is ThemeDark,
                        onChanged: (value) {
                          context.read<ThemeBloc>().add(ToggleTheme());
                        }),
                  ],
                ),
              ],
            );
          }),
        ));
  }
}
