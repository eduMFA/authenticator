import 'package:edumfa_authenticator/views/main_view/main_view_widgets/token_widgets/default_token_actions/default_delete_action.dart';
import 'package:edumfa_authenticator/views/main_view/main_view_widgets/token_widgets/default_token_actions/default_edit_action.dart';
import 'package:edumfa_authenticator/views/main_view/main_view_widgets/token_widgets/default_token_actions/default_lock_action.dart';
import 'package:edumfa_authenticator/views/main_view/main_view_widgets/token_widgets/token_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../model/tokens/push_token.dart';
import '../token_widget_tile.dart';

class PushTokenWidgetTile extends ConsumerWidget {
  final PushToken token;

  const PushTokenWidgetTile(this.token, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<TokenAction> menuEntries = [
      DefaultDeleteAction(token: token, key: Key('${token.id}deleteAction')),
      DefaultEditAction(token: token, key: Key('${token.id}editAction')),
    ];

    if ((token.pin == false)) {
      menuEntries.add(
        DefaultLockAction(token: token, key: Key('${token.id}lockAction')),
      );
    }

    return TokenWidgetTile(
        key: Key('${token.hashCode}TokenWidgetTile'),
        tokenIsLocked: token.isLocked,
        tokenImage: token.tokenImage,
        title: Text(
          token.label.isNotEmpty ? token.label : token.serial,
          style: const TextStyle(
            fontSize: 18,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        subtitles: [
          if (token.issuer.isNotEmpty) token.issuer,
        ],
        trailing: PopupMenuButton<String>(
          onSelected: (value) {},
          itemBuilder: (context) => menuEntries.map((e) => e.build(context, ref)).toList(),
        ));
  }
}
