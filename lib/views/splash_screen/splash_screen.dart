import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/enums/introduction.dart';

import '../../utils/home_widget_utils.dart';
import '../../utils/logger.dart';
import '../../utils/riverpod_providers.dart';
import '../main_view/main_view.dart';
import '../onboarding_view/onboarding_view.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const routeName = '/';

  final Widget appImage;
  final Widget appIcon;
  final String appName;

  const SplashScreen({required this.appImage, required this.appIcon, required this.appName, super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  var _appIconIsVisible = false;
  final _splashScreenDuration = const Duration(milliseconds: 400);
  final _splashScreenDelay = const Duration(milliseconds: 250);

  @override
  void initState() {
    super.initState();
    homeWidgetInit();

    Logger.info('Starting app.', name: 'main.dart#initState');
    Future.delayed(_splashScreenDelay, () {
      if (mounted) {
        setState(() {
          _appIconIsVisible = true;
        });
      }
    });
    _init();
  }

  Future<void> _init() async {
    await Future.delayed(_splashScreenDuration + _splashScreenDelay * 2);
    await ref.read(introductionProvider.notifier).loadingRepo;
    final isFirstRun = ref.read(introductionProvider).isConditionFulfilled(ref, Introduction.introductionScreen);
    final ConsumerStatefulWidget nextView;
    if (isFirstRun) {
      nextView = OnboardingView(appName: widget.appName);
    } else {
      nextView = MainView(appName: widget.appName, appIcon: widget.appIcon);
    }
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => nextView,
        transitionDuration: _splashScreenDuration * 2,
        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: AnimatedOpacity(
          opacity: _appIconIsVisible ? 1.0 : 0.0,
          duration: _splashScreenDuration,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: widget.appImage,
          ),
        ),
      ),
    );
  }
}
