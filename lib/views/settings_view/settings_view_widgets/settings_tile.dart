import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String? iconSvgAsset;
  final Widget? titleIcon;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool? isLink;
  final Widget? trailing;

  const SettingsTile({
    super.key,
    required this.title,
    this.icon,
    this.iconSvgAsset,
    this.titleIcon,
    this.onTap,
    this.subtitle,
    this.isLink,
    this.trailing,
  }) : assert(isLink == null || trailing == null, 'isLink and trailing cannot be passed together');

  @override
  Widget build(BuildContext context) {
    Widget? leading;
    if (iconSvgAsset != null) {
      leading = SvgPicture.asset(
        iconSvgAsset!,
        height: IconTheme.of(context).size,
        colorFilter: ColorFilter.mode(
            ColorScheme.of(context).primary,
            BlendMode.srcIn
        ),
      );
    }
    else if (icon != null) {
      leading = Icon(icon, color: ColorScheme.of(context).primary);
    }

    return ListTile(
      leading: leading,
      title: Row(
        children: [
          Text(title),
          if (titleIcon != null) titleIcon!,
        ],
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextTheme.of(context).labelMedium?.copyWith(
                  color: Colors.grey.shade500
              ),
          )
          : null,
      onTap: onTap,
      trailing: trailing ??
          (isLink == true
              ? const Icon(Icons.launch)
              : const SizedBox()),
    );
  }
}