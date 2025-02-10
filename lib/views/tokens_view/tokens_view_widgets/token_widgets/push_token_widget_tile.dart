import 'dart:typed_data';

import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_widgets/token_edit_sheet.dart';
import 'package:edumfa_authenticator/widgets/squircle_clipper.dart';
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
        leading: (token.tokenImage != null) ? TokenImage(token.tokenImage) : null,
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

final Map<String?, Uint8List?> _tokenImageCache = {};

/// Returns the cached bytes if available, otherwise loads them.
Future<Uint8List?> fetchTokenImageBytes(String? tokenImageUrl) async {
  // If already cached, return the cached bytes.
  if (_tokenImageCache.containsKey(tokenImageUrl)) {
    return _tokenImageCache[tokenImageUrl];
  }
  // Check for valid URL.
  if (tokenImageUrl == null ||
      tokenImageUrl.isEmpty ||
      Uri.tryParse(tokenImageUrl) == null) {
    _tokenImageCache[tokenImageUrl] = null;
    return null;
  }
  try {
    final response = await http.get(
      Uri.parse(tokenImageUrl),
      headers: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
            'AppleWebKit/537.36 (KHTML, like Gecko) '
            'Chrome/90.0.4430.93 Safari/537.36'
      },
    );
    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      _tokenImageCache[tokenImageUrl] = bytes;
      return bytes;
    }
  } catch (e) {
    // Optionally log the error.
    debugPrint("Failed to fetch image from $tokenImageUrl: $e");
  }
  _tokenImageCache[tokenImageUrl] = null;
  return null;
}

/// A widget that shows a token image from a URL (if available).
class TokenImage extends StatelessWidget {
  final String? tokenImageUrl;

  const TokenImage(this.tokenImageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    // Use FutureBuilder to handle async loading.
    return FutureBuilder<Uint8List?>(
      future: fetchTokenImageBytes(tokenImageUrl),
      builder: (context, snapshot) {
        // While waiting, show a loading indicator.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 32,
            width: 32,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        // If we failed to load an image, return an empty widget.
        if (!snapshot.hasData || snapshot.data == null) {
          return const SizedBox();
        }

        // On success, display the image.
        return Padding(
          padding: const EdgeInsets.only(left: 4, top: 2, right: 4),
          child: SizedBox(
            height: 32,
            child: ClipPath(
              clipper: const SquircleClipper(0.5),
              child: Image.memory(
                snapshot.data!,
                fit: BoxFit.fitHeight,
                errorBuilder: (context, error, stackTrace) {
                  // Log the error and return an empty widget.
                  debugPrint("Error displaying token image: $error");
                  return const SizedBox();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

