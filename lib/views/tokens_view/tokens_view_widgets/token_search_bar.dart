import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/model/states/token_filter.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class TokenSearchBar extends ConsumerStatefulWidget {
  const TokenSearchBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TokenSearchBarState();
}

class _TokenSearchBarState extends ConsumerState<TokenSearchBar> {
  final GlobalKey _searchBarKey = GlobalKey();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var tokenFilter = ref.read(tokenFilterProvider.notifier).state;
    return SearchBar(
      key: _searchBarKey,
      controller: _searchController,
      hintText: S.of(context).search,
      textInputAction: TextInputAction.search,
      focusNode: _searchFocusNode,
      onTapOutside: (event) {
        final RenderBox box = _searchBarKey.currentContext?.findRenderObject() as RenderBox;
        final Rect rect = box.localToGlobal(Offset.zero) & box.size;
        if (!rect.contains(event.position)) {
          _searchFocusNode.unfocus();
        }
      },
      onTap: () async => await Haptics.vibrate(HapticsType.soft),
      onChanged: (value) {
        ref.read(tokenFilterProvider.notifier).state = _searchController.text.isEmpty
            ? null
            : TokenFilter(searchQuery: value);
        setState(() {});
      },
      leading: SizedBox(
        width: 50,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: _searchFocusNode.hasFocus || tokenFilter != null
              ? const Center(child: Icon(Icons.search))
              : SvgPicture.asset(
            'res/logo/app_icon.svg',
            width: 32,
            height: 32,
            colorFilter: ColorFilter.mode(
                Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                BlendMode.srcIn
            ),
          ),
        ),
      ),
      trailing: [
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: tokenFilter?.searchQuery.isNotEmpty ?? false
                ? IconButton(
                    onPressed: () {
                      _searchController.clear();
                      ref.read(tokenFilterProvider.notifier).state = null;
                      setState(() {});
                    },
                    icon: const Icon(Icons.close)
                  )
                : const SizedBox()
        )
      ],
      constraints: const BoxConstraints(minHeight: double.infinity),
      elevation: WidgetStateProperty.all<double>(0),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

}