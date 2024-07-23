import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practice/animations/hero_animations/hero_test.dart';
import 'package:practice/animations/utils/app_colors.dart';
import 'package:practice/animations/utils/data.dart';
import 'package:practice/animations/utils/extenstion.dart';
import 'package:practice/animations/utils/screens/home.dart';

import 'package:practice/clean_archi_tdd_number_trivia/core/dependency_injection/service_locator.dart';

import 'package:practice/getx/getTest.dart';
import 'package:practice/theming/custom_theme.dart';
import 'package:practice/theming/theme_bloc/theme_bloc.dart';
import 'package:practice/theming/theme_test.dart';
import 'dart:developer' as devtools show log;

import 'animations/utils/ink_response.dart';
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
            home: const Homepage(),
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

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rippleAnimation;
  late double _begin, _end;
  bool _onHideBorder = false;
  int _pageIndex = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _begin = 30;
    _end = 20;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));

    _rippleAnimation = Tween<double>(begin: _begin, end: _end)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          print('completed');
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _hideBorder() {
    setState(() {
      _onHideBorder = false;
    });
  }

  void _onDisplayBorder() {
    setState(() {
      _onHideBorder = true;
    });
  }

  void _onTap() {
    _onDisplayBorder();
    setState(() {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: AppColors.bgGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        ),
        [
          const PortfolioHome(),
          const PortfolioHome(),
          const PortfolioHome(),
          const PortfolioHome(),
          const PortfolioHome(),
        ][_pageIndex],

        //--------------------Nav Bar Widget-----------------

        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: kBottomNavigationBarHeight * 1.4,
            width: context.sizeWidth(0.87),
            child: Card(
              color: context.colorScheme.onSurface.withOpacity(0.95),
              shape: const StadiumBorder(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(
                    5,
                    (index) => InkResponseWidget(
                      index: index,
                      onTap: () {
                        _onTap();
                        setState(() {
                          _pageIndex = index;
                        });
                      },
                      rippleAnimation: _rippleAnimation,
                      width: _pageIndex == index ? 55 : 47,
                      height: _pageIndex == index ? 55 : 47,
                      showRipple: _pageIndex == index,
                      onHideBorder: _onHideBorder,
                      decoration: BoxDecoration(
                        color: _pageIndex == index && !_onHideBorder
                            ? Colors.purple
                            : _pageIndex == 0
                                ? Colors.black26
                                : context.colorScheme.onSurface,
                        shape: BoxShape.circle,
                        border: _onHideBorder && _pageIndex == index
                            ? Border.all(
                                color: context.colorScheme.surface, width: 1)
                            : null,
                      ),
                      child: SvgPicture.asset(
                        navbarIcons.values.toList()[index],
                        color: context.colorScheme.surface,
                        height: _pageIndex == index ? 28 : null,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ).slideInFromBottom(
            delay: 3000.ms, animationDuration: 2500.ms, begin: 0.9),
      ],
    ));
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
