import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:edumfa_authenticator/utils/app_info_utils.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/views/main_view/main_view.dart';
import 'package:edumfa_authenticator/views/onboarding_view/onboarding_view.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const routeName = '/';
  static Widget? _initialView;
  static bool didNavigated = false;

  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();

  static void setInitialView(Widget initialView) {
    if (_initialView != null) {
      Logger.warning('Initial view is already set. Ignoring new initial view: $initialView', name: 'splash_screen.dart#setInitialView');
      return;
    }
    if (didNavigated) {
      Logger.warning('Splashscreen already navigated. Ignoring new initial view: $initialView', name: 'splash_screen.dart#setInitialView');
      return;
    }
    _initialView = initialView;
  }
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  var _appIconIsVisible = false;
  final _splashScreenDuration = const Duration(milliseconds: 400);
  final _splashScreenDelay = const Duration(milliseconds: 250);

  @override
  void initState() {
    super.initState();

    Logger.info('Starting app.', name: 'main.dart#initState');
    Future.delayed(_splashScreenDelay, () {
      if (mounted) {
        setState(() {
          _appIconIsVisible = true;
        });
      }
      Future.wait(
        <Future>[
          Future.delayed(_splashScreenDuration),
          ref.read(settingsProvider.notifier).loadingRepo,
          ref.read(tokenProvider.notifier).loadingRepo,
          AppInfoUtils.init(),
        ],
        eagerError: true,
        cleanUp: (error) {
          Logger.error('Error while loading the app.', error: error, stackTrace: StackTrace.current, name: 'main.dart#initState');
        },
      ).then((values) => _navigate());
    });
  }

  @override
  void dispose() {
    Logger.info('Disposing Splash Screen', name: 'main.dart#dispose');
    super.dispose();
  }

  Future<void> _navigate() async {
    SplashScreen.didNavigated = true;
    if (SplashScreen._initialView != null) {
      await Navigator.push<bool>(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => SplashScreen._initialView!,
          transitionDuration: _splashScreenDuration,
          transitionsBuilder: (_, a, __, view) => FadeTransition(
            opacity: CurvedAnimation(
              curve: const Interval(0, 1, curve: Curves.easeOut),
              parent: a,
            ),
            child: view,
          ),
        ),
      );
    }

    _pushReplace();
  }

  void _pushReplace() {
    final ViewWidget nextView = ref.read(settingsProvider).isFirstRun ? const OnboardingView() : const MainView();
    final routeBuilder = SplashScreen._initialView == null
        ? PageRouteBuilder(
            pageBuilder: (_, __, ___) => nextView,
            transitionDuration: _splashScreenDuration,
            settings: nextView.routeSettings,
            transitionsBuilder: (_, a, __, view) => FadeTransition(
              opacity: CurvedAnimation(
                curve: const Interval(0, 1, curve: Curves.easeOut),
                parent: a,
              ),
              child: view,
            ),
          )
        : PageRouteBuilder(
            pageBuilder: (_, __, ___) => nextView,
          );
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(context, routeBuilder);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: AnimatedOpacity(
          opacity: _appIconIsVisible ? 1.0 : 0.0,
          duration: _splashScreenDuration,
          curve: Curves.easeOut,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: SvgPicture.asset(
              'res/logo/app_image.svg',
              colorFilter: ColorFilter.mode(
                  Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                  BlendMode.srcIn
              ),
            ),
          ),
        ),
      ),
    );
  }
}
