import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/utils/utils.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/add_token_sheet.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/connectivity_listener.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_search_bar.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/tokens_list.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';
import 'package:edumfa_authenticator/widgets/conditional_floating_action_button.dart';
import 'package:edumfa_authenticator/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class TokensView extends ConsumerStatefulView {
  static const routeName = '/tokens';

  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);

  const TokensView({super.key});

  @override
  ConsumerState<TokensView> createState() => TokensViewState();
}

class TokensViewState extends ConsumerState<TokensView> {

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      material: (_, __) => MaterialScaffoldData(
        resizeToAvoidBottomInset: false,
        floatingActionButton: !isTablet(context)
            ? ConditionalFloatingActionButton(
          isExtended: ref.watch(tokenProvider).tokens.isEmpty,
          label: S.of(context).addToken,
          icon: Icons.add,
          onPressed: () async => await showAddTokenSheet(context),
        ) : null,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TokenSearchBar(),
            ),
          ),
        ),
      ),
      appBar: PlatformAppBar(
        cupertino: (context, platform) => CupertinoNavigationBarData(
          title: Text(S.of(context).tokens),
          trailing: CupertinoButton(
            child: const Icon(CupertinoIcons.add),
            onPressed: () async => await showAddTokenSheet(context),
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(35.0 + 8 * 2), 
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: TokenSearchBar(),
              )
          ),
        ),
      ),
      body: const ConnectivityListener(
        child: StatusBar(
          child: TokensList(),
        ),
      ),
    );
  }

  Future<void> showAddTokenSheet(BuildContext context) async {
    await Haptics.vibrate(HapticsType.rigid);
    if (!context.mounted) return;
    if (isMaterial(context)) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) => const AddTokenSheetWidget(),
      );
    } else {
      showCupertinoSheet(
          context: context,
          pageBuilder: (_) => const CupertinoPageScaffold(
              child: AddTokenSheetWidget(),
          ),
      );
    }

    }

}
