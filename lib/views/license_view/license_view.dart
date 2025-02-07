import 'package:flutter/material.dart';

import 'package:edumfa_authenticator/views/view_interface.dart';

class LicenseView extends StatelessView {
  static const String routeName = '/license';

  const LicenseView({super.key});

  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);

  @override
  Widget build(BuildContext context) => const LicensePage();
}
