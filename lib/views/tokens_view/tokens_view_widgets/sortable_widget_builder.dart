import 'package:flutter/material.dart';

import '../../../model/mixins/sortable_mixin.dart';
import '../../../model/tokens/token.dart';
import 'token_widgets/token_widget_builder.dart';

abstract class SortableWidgetBuilder {
  static Widget fromSortable(SortableMixin sortable, {Key? key}) {
    if (sortable is Token) return TokenWidgetBuilder.fromToken(sortable, key: key);
    throw UnimplementedError('Sortable type (${sortable.runtimeType}) not supported');
  }
}
