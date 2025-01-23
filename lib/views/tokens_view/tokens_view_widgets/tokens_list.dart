import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/model/tokens/token.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/no_token_screen.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/poll_loading_indicator.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_widgets/push_token_widgets/push_token_widget.dart';
import 'package:edumfa_authenticator/widgets/conditional_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TokensList extends ConsumerStatefulWidget {
  const TokensList({super.key});

  @override
  ConsumerState<TokensList> createState() => _TokensListState();
}

class _TokensListState extends ConsumerState<TokensList> {


  @override
  Widget build(BuildContext context) {
    final tokenState = ref.watch(tokenProvider);
    final allowToRefresh = tokenState.hasPushTokens && ref.watch(tokenFilterProvider) == null;

    if (tokenState.tokens.isEmpty) return const NoTokenScreen();

    return ConditionalRefreshIndicator(
      allowToRefresh: allowToRefresh,
      onRefresh: () async => PollLoadingIndicator.pollForChallenges(context),
      child: SlidableAutoCloseBehavior(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: CustomScrollView(
            physics: allowToRefresh ? const AlwaysScrollableScrollPhysics() : const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    ..._mapTokensToWidgets(tokenState.tokens),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _mapTokensToWidgets(List<Token> tokens) {
    final filter = ref.watch(tokenFilterProvider);
    var filteredTokens = tokens;
    if (filter != null) filteredTokens = filter.filterTokens(ref.watch(tokenProvider).tokens);

    List<Widget> widgets = [];
    //tokens.sort((a, b) => a.compareTo(b));
    for (var i = 0; i < filteredTokens.length; i++) {
      widgets.add(PushTokenWidget(filteredTokens[i] as PushToken));
      if (i != filteredTokens.length - 1) {
        widgets.add(const Divider(indent: 10, endIndent: 10));
      }
    }

    return widgets;
  }
}
