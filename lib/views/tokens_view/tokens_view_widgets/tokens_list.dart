import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/no_token_screen.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/poll_loading_indicator.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_widgets/push_token_widget.dart';
import 'package:edumfa_authenticator/widgets/conditional_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    final filter = ref.watch(tokenFilterProvider);
    var filteredTokens = filter != null ? filter.filterTokens(tokenState.tokens) : tokenState.tokens;
    List<Widget> tokenWidgets = filteredTokens
        .map((token) => PushTokenWidget(token as PushToken)).toList();

    return ConditionalRefreshIndicator(
      allowToRefresh: allowToRefresh,
      onRefresh: () async => PollLoadingIndicator.pollForChallenges(context),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            children: tokenWidgets,
          ),
        ),
      ),
    );
  }
}
