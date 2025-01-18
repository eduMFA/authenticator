import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/riverpod_providers.dart';
import 'token_widgets/token_widget_builder.dart';

class TokenList extends ConsumerWidget {
  const TokenList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ..._mapTokensToWidgets(ref: ref),
        ],
      ),
    );
  }

  List<Widget> _mapTokensToWidgets({required WidgetRef ref}) {
    final filter = ref.watch(tokenFilterProvider);
    if (filter == null) return [];
    final tokens = filter.filterTokens(ref.watch(tokenProvider).tokens);

    tokens.sort((a, b) => a.compareTo(b));
    final List<Widget> widgets = [];
    for (int i = 0; i < tokens.length; i++) {
      final sortable = tokens[i];
      widgets.add(TokenWidgetBuilder.fromToken(sortable));
      if (i != tokens.length - 1) {
        widgets.add(const Divider());
      }
    }
    return widgets;
  }
}