import 'package:flutter/material.dart';

import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/processors/scheme_processors/scheme_processor_interface.dart';

abstract class NavigationSchemeProcessor implements SchemeProcessor {
  const NavigationSchemeProcessor();

  static Set<NavigationSchemeProcessor> implementations = {
  };

  @override
  Future<void> processUri(Uri uri, {BuildContext? context, bool fromInit = false});

  static Future<void> processUriByAny(Uri uri, {BuildContext? context, required bool fromInit}) async {
    if (context == null) {
      Logger.info('Current context is null, waiting for navigator context', name: 'processUri#NavigationSchemeProcessor');
      final key = await contextedGlobalNavigatorKey;
      context = key.currentContext;
    }
    Logger.info('Processing scheme: ${uri.scheme}', name: 'processUri#NavigationSchemeProcessor');
    final futures = <Future<void>>[];
    for (final processor in implementations) {
      Logger.info('Supported schemes [${processor.supportedSchemes}] for processor ${processor.runtimeType}', name: 'processUri#NavigationSchemeProcessor');
      if (processor.supportedSchemes.contains(uri.scheme)) {
        Logger.info('Processing scheme ${uri.scheme} with ${processor.runtimeType}', name: 'processUri#NavigationSchemeProcessor');
        // ignoring use_build_context_synchronously is ok because we got the context after the await. The Context cannot be expired.
        // ignore: use_build_context_synchronously
        futures.add(processor.processUri(uri, context: context, fromInit: fromInit));
      }
    }
    await Future.wait(futures);
    return;
  }
}
