import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class TokenAction extends ConsumerWidget {
  const TokenAction({super.key});
  @override
  PopupMenuItem<String> build(BuildContext context, WidgetRef ref);
}
