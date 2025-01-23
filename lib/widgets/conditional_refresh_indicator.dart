import 'package:flutter/material.dart';

class ConditionalRefreshIndicator extends StatelessWidget {
  final Widget child;
  final bool allowToRefresh;
  final Future<void> Function() onRefresh;

  const ConditionalRefreshIndicator({
    super.key,
    required this.child,
    required this.allowToRefresh,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return allowToRefresh
        ? RefreshIndicator(
            onRefresh: onRefresh,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: child,
          )
        : child;
  }
}
