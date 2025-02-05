import 'dart:typed_data';

import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_widgets/token_edit_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class PushTokenWidgetTile extends ConsumerWidget {
  final PushToken token;

  const PushTokenWidgetTile(this.token, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ListTile(
        key: Key('${token.hashCode}TokenWidgetTile'),
        leading: (token.tokenImage != null) ? TokenImage(tokenImage: token.tokenImage) : null,
        title: Text(
          token.label.isNotEmpty ? token.label : token.serial,
          style: TextTheme.of(context).titleMedium,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: (token.issuer.isNotEmpty)
            ? Text(
                token.issuer,
                overflow: TextOverflow.fade,
                softWrap: false,
            )
            : null,
        onLongPress: () => _showEditModal(context, token),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => _showEditModal(context, token),
        ),
        tileColor: ColorScheme.of(context).surfaceContainer,
        textColor: ColorScheme.of(context).onSecondaryContainer,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
    );
  }
}

void _showEditModal(BuildContext context, PushToken token) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (context) => TokenEditSheet(token: token),
  );
}

final tokenImages = <String?, Uint8List?>{};

Future<Uint8List?> getTokenImageBytesAsync(String? tokenImageUrl) async {
  if (tokenImages.containsKey(tokenImageUrl)) {
    return tokenImages[tokenImageUrl]!;
  } else {
    if (tokenImageUrl == null ||
        tokenImageUrl.isEmpty ||
        Uri.tryParse(tokenImageUrl) == null) {
      tokenImages[tokenImageUrl] = null;
      return null;
    }
    http.Response response;
    try {
      response = await http.get(Uri.parse(tokenImageUrl));
    } catch (e) {
      return null;
    }
    final newTokenImage = response.bodyBytes;
    tokenImages[tokenImageUrl] = newTokenImage;
    return newTokenImage;
  }
}

Uint8List? getTokenImageBytesSync(String? tokenImageUrl) =>
    tokenImages[tokenImageUrl];

class TokenImage extends StatefulWidget {
  final String? tokenImage;

  const TokenImage({super.key, this.tokenImage});

  @override
  State<TokenImage> createState() => _TokenImageState();
}

class _TokenImageState extends State<TokenImage> {
  late bool hasImage;
  Image? tokenImage;

  @override
  void initState() {
    super.initState();
    hasImage = widget.tokenImage != null && widget.tokenImage!.isNotEmpty;
    final imageBytes = getTokenImageBytesSync(widget.tokenImage);
    if (imageBytes != null) {
      tokenImage = Image.memory(
        imageBytes,
        fit: BoxFit.fitHeight,
        errorBuilder: (context, error, stackTrace) {
          if (!mounted) return const SizedBox();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            setState(() {
              hasImage = false;
            });
          });
          return const SizedBox();
        },
      );
    } else {
      _loadImage();
    }
  }

  void _loadImage() {
    if (!hasImage || tokenImage != null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final uint8List = await getTokenImageBytesAsync(widget.tokenImage);
      if (uint8List == null) {
        setState(() {
          hasImage = false;
        });
        return;
      }
      setState(() {
        tokenImage = Image.memory(
          uint8List,
          fit: BoxFit.fitHeight,
          errorBuilder: (context, error, stackTrace) {
            if (!mounted) return const SizedBox();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              setState(() {
                hasImage = false;
              });
            });
            return const SizedBox();
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) => hasImage
      ? Padding(
          padding: const EdgeInsets.only(left: 4, top: 2, right: 4),
          child: SizedBox(
            height: 32,
            child: tokenImage ??
                const SizedBox(
                  width: 32,
                  child: CircularProgressIndicator(),
                ),
          ),
      )
      : const SizedBox();
}
