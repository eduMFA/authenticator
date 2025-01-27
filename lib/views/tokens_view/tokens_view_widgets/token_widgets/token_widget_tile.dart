import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final disableCopyOtpProvider = StateProvider<bool>((ref) => false);

class TokenWidgetTile extends ConsumerWidget {
  final Widget title;
  final String? subtitle;
  final Widget? trailing;
  final String? tokenImage;
  final VoidCallback? onLongPress;


  const TokenWidgetTile({
    required this.title,
    this.subtitle,
    this.trailing,
    this.tokenImage,
    this.onLongPress,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    child: ListTile(
          leading: (tokenImage != null) ? TokenImage(tokenImage: tokenImage) : null,
          title: title,
          subtitle: subtitle != null
              ? Text(
                subtitle!,
                overflow: TextOverflow.fade,
                softWrap: false,
              )
              : const SizedBox(),
          trailing: trailing ?? const SizedBox(),
          onLongPress: onLongPress,
          tileColor: Theme.of(context).colorScheme.surfaceContainer,
          textColor: Theme.of(context).colorScheme.onSecondaryContainer,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        ),
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
          ))
      : const SizedBox();
}
