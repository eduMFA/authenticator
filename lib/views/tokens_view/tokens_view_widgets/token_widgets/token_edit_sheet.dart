import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/model/tokens/token.dart';
import 'package:edumfa_authenticator/utils/lock_auth.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/widgets/dialog_widgets/default_dialog.dart';
import 'package:flutter/material.dart';

class TokenEditSheet extends StatefulWidget {
  static const maxTokenLength = 30;

  final Token token;

  const TokenEditSheet({super.key, required this.token});

  @override
  State<TokenEditSheet> createState() => _TokenEditSheetState();
}

class _TokenEditSheetState extends State<TokenEditSheet> {
  final _focusNode = FocusNode();
  late final TextEditingController _textFieldController = TextEditingController(text: widget.token.label);
  late int _currentLength = _textFieldController.text.length;
  late bool isLocked = widget.token.isLocked;
  bool _hasChanged = false;

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(_updateCurrentLength);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 0),
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 16, // Handles keyboard and moves up content.
          left: 16,
          right: 16
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                "Edit Token",
                textAlign: TextAlign.left,
                style: TextTheme.of(context)
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _textFieldController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: S.of(context).name,
                counterText: "$_currentLength/${TokenEditSheet.maxTokenLength}",
              ),
              maxLength: TokenEditSheet.maxTokenLength,
              onTapOutside: (event) => _focusNode.unfocus(),
            ),
            const SizedBox(height: 5),
            ListTile(
              title: Text('Locked'),
              subtitle: Text("If the token is locked..."),
              trailing: Switch(
                  value: isLocked,
                  onChanged: (value) {
                    setState(() {
                      isLocked = !isLocked;
                      _hasChanged = hasChanged();
                    });
                  }
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.red.shade200),
                  ),
                  onPressed: deleteToken,
                  child: Text(S.of(context).delete),
                ),
                FilledButton(
                    onPressed: _hasChanged ? saveToken : null,
                    child: Text("Save Changes")
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void saveToken() async {
    if (widget.token.isLocked && await lockAuth(localizedReason: S.of(context).deleteLockedToken) == false) return;
    final newLabel = _textFieldController.text.trim();
    if (newLabel.isEmpty) return;
    globalRef?.read(tokenProvider.notifier).updateToken(
        widget.token, (p0) => p0.copyWith(label: newLabel, isLocked: isLocked)
    );

    Logger.info(
      'Updated token:',
      name: 'token_edit_sheet.dart#TokenEditSheet#saveToken',
      error: '\'${widget.token.label}\' changed to \'$newLabel\', isLocked = $isLocked',
    );

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  Future<void> deleteToken() async {
    if (widget.token.isLocked && await lockAuth(localizedReason: S.of(context).deleteLockedToken) == false) return;
    _showDeleteDialog();
  }

  void _showDeleteDialog() => showDialog(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return DefaultDialog(
          scrollable: true,
          title: Text(
            S.of(context).confirmDeletion,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.error),
          ),
          content: Column(
            children: [
              Text(S.of(context).confirmDeletionOf(widget.token.label), style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text(
                S.of(context).confirmTokenDeletionHint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                S.of(context).cancel,
                overflow: TextOverflow.fade,
                softWrap: false,
              ),
            ),
            TextButton(
              onPressed: () {
                globalRef?.read(tokenProvider.notifier).removeToken(widget.token);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).delete,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
                overflow: TextOverflow.fade,
                softWrap: false,
              ),
            ),
          ],
        );
      });

  bool hasChanged() {
    return _hasChanged =
        _textFieldController.text.isNotEmpty &&
            (
                _textFieldController.text != widget.token.label
                    || isLocked != widget.token.isLocked
            );
  }

  void _updateCurrentLength() {
    setState(() {
      _currentLength = _textFieldController.text.length;
      _hasChanged = hasChanged();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textFieldController.dispose();
    _textFieldController.removeListener(_updateCurrentLength);
    super.dispose();
  }
}
