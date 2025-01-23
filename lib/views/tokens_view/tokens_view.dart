import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/model/states/token_filter.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/add_token_sheet.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/connectivity_listener.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/expandable_appbar.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/tokens_list.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';
import 'package:edumfa_authenticator/widgets/conditional_floating_action_button.dart';
import 'package:edumfa_authenticator/widgets/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokensView extends ConsumerStatefulView {
  static const routeName = '/tokens';

  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);

  const TokensView({super.key});

  @override
  ConsumerState<TokensView> createState() => TokensViewState();
}

class TokensViewState extends ConsumerState<TokensView> {

  void showAddTokenSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => const AddTokenSheetWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasFilter = ref.watch(tokenFilterProvider) != null;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: ConditionalFloatingActionButton(
        isExtended: ref.watch(tokenProvider).tokens.isEmpty,
        label: S.of(context).addToken,
        icon: Icons.add,
        onPressed: () => showAddTokenSheet(context),
      ),
      body: ExpandableAppBar(
        startExpand: hasFilter,
        appBar: AppBar(
            titleSpacing: 6,
            centerTitle: true,
            actions: [
              IconButton(
                padding: const EdgeInsets.all(0),
                splashRadius: 20,
                onPressed: () => ref.read(tokenFilterProvider.notifier).state =
                hasFilter
                    ? null
                    : TokenFilter(searchQuery: ''),
                color: Theme.of(context).navigationBarTheme.iconTheme?.resolve({})?.color,
                icon: SizedBox(
                  height: 24,
                  width: 24,
                  child: FittedBox(child: Icon(hasFilter ? Icons.close : Icons.search)),
                ),
              ),
            ],
        ),
        body: const ConnectivityListener(
          child: StatusBar(
            child: TokensList(),
          ),
        ),
      ),
    );
  }
}
