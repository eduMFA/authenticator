import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_widgets/token_edit_sheet.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_widgets/token_widget_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PushTokenWidgetTile extends ConsumerWidget {
  final PushToken token;

  const PushTokenWidgetTile(this.token, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //final List<TokenAction> menuEntries = [
    //  DefaultDeleteAction(token: token, key: Key('${token.id}deleteAction')),
    //  DefaultEditAction(token: token, key: Key('${token.id}editAction')),
    //];

    //if (!token.pin) {
    //  menuEntries.add(
    //    DefaultLockAction(token: token, key: Key('${token.id}lockAction')),
    //  );
    //}

    return TokenWidgetTile(
        key: Key('${token.hashCode}TokenWidgetTile'),
        tokenImage: token.tokenImage,
        title: Text(
          token.label.isNotEmpty ? token.label : token.serial,
          style: Theme.of(context).textTheme.titleMedium,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: (token.issuer.isNotEmpty) ? token.issuer : null,
        onLongPress: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          builder: (context) => TokenEditSheet(token: token),
        ),
        //trailing: PopupMenuButton<String>(
        //  onSelected: (value) {},
        //  itemBuilder: (context) => menuEntries.map((e) => e.build(context, ref)).toList(),
        //),
    );
  }
}
