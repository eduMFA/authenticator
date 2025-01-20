import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/connectivity_listener.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/main_view_navigation_buttons/qr_scanner_button.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_search_bar.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/tokens_list.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/tokens_list_filtered.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';
import 'package:edumfa_authenticator/widgets/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokensView extends ConsumerStatefulView {
  static const routeName = '/tokens';

  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);

  const TokensView({super.key});

  @override
  ConsumerState<TokensView> createState() => _TokensViewState();
}

class _TokensViewState extends ConsumerState<TokensView> {
  final globalKey = GlobalKey<NestedScrollViewState>();

  @override
  Widget build(BuildContext context) {
    final hasFilter = ref.watch(tokenFilterProvider) != null;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: const QrScannerButton(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TokenSearchBar(),
          ),
        ),
      ),
      body: ConnectivityListener(
          child: StatusBar(
            child: !hasFilter
                ? Stack(
                    children: [
                      TokensList(nestedScrollViewKey: globalKey),
                    ],
                  )
                : const TokensListFiltered(),
          ),
      ),
    );
  }
}
