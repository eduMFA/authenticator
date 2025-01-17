import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';

class NoTokenScreen extends StatelessWidget {
  const NoTokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            S.of(context).noResultTitle,
            style: Theme.of(context).textTheme.headlineSmall,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
          Wrap(
            children: [
              Text(
                S.of(context).noResultText1,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.fade,
                softWrap: false,
              ),
              const Icon(Icons.qr_code),
              Text(
                S.of(context).noResultText2,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.fade,
                softWrap: false,
              )
            ],
          ),
        ],
      )),
    );
  }
}
