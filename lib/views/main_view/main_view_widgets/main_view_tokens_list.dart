import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../model/mixins/sortable_mixin.dart';
import '../../../utils/riverpod_providers.dart';
import '../../../widgets/deactivateable_refresh_indicator.dart';
import '../../../widgets/drag_item_scroller.dart';
import 'drag_target_divider.dart';
import 'no_token_screen.dart';
import 'poll_loading_indicator.dart';
import 'sortable_widget_builder.dart';

class MainViewTokensList extends ConsumerStatefulWidget {
  final GlobalKey<NestedScrollViewState> nestedScrollViewKey;

  const MainViewTokensList({super.key, required this.nestedScrollViewKey});

  @override
  ConsumerState<MainViewTokensList> createState() => _MainViewTokensListState();
}

class _MainViewTokensListState extends ConsumerState<MainViewTokensList> {
  final listViewKey = GlobalKey();
  final scrollController = ScrollController();

  Duration? lastTimeStamp;

  @override
  Widget build(BuildContext context) {
    final tokenState = ref.watch(tokenProvider);
    final allowToRefresh = tokenState.hasPushTokens;
    final draggingSortable = ref.watch(draggingSortableProvider);

    final tokens = tokenState.tokens;

    return Stack(
      children: [
        if (tokens.isEmpty) const NoTokenScreen(),
        DeactivateableRefreshIndicator(
          allowToRefresh: allowToRefresh,
          onRefresh: () async => PollLoadingIndicator.pollForChallenges(context),
          child: SlidableAutoCloseBehavior(
            child: DragItemScroller(
              listViewKey: listViewKey,
              itemIsDragged: draggingSortable != null,
              scrollController: scrollController,
              child: CustomScrollView(
                key: listViewKey,
                physics: allowToRefresh ? const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()) : const BouncingScrollPhysics(),
                controller: scrollController,
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Column(
                            children: [
                              ..._buildSortableWidgets(tokens, draggingSortable),
                            ],
                        ),
                        ...(draggingSortable != null)
                            ? [
                                const DragTargetDivider(nextSortable: null, isLastDivider: true, bottomPaddingIfLast: 80),
                                const Expanded(
                                  child: Opacity(
                                      opacity: 0,
                                      child: DragTargetDivider(nextSortable: null, isLastDivider: true, bottomPaddingIfLast: 80)),
                                )
                              ]
                            : [const SizedBox(height: 80)]
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildSortableWidgets(List<SortableMixin> sortables, SortableMixin? draggingSortable) {
    List<Widget> widgets = [];
    if (sortables.isEmpty) return [];
    sortables.sort((a, b) => a.compareTo(b));
    for (var i = 0; i < sortables.length; i++) {
      final isFirst = i == 0;
      final isDraggingTheCurrent = draggingSortable == sortables[i];
      // 1. Add a divider if the current sortable is not the one which is dragged
      // 2. Dont add a divider if the current sortable is the first
      // 3. Dont add a divider if the previous sortable was an expanded folder
      // 4. Ignore 2. and 3. if there is a sortable that is dragged
      //           1                     2                     3                         4
      if (!isDraggingTheCurrent && (!isFirst || draggingSortable != null)) {
        widgets.add(DragTargetDivider(nextSortable: sortables[i]));
      }
      widgets.add(SortableWidgetBuilder.fromSortable(sortables[i]));
    }

    return widgets;
  }
}
