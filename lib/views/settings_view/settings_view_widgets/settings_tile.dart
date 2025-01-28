import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? titleIcon;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool? isLink;
  final Widget? trailing;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.titleIcon,
    this.onTap,
    this.subtitle,
    this.isLink,
    this.trailing,
  }) : assert(isLink == null || trailing == null, 'isLink and trailing cannot be passed together');

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: ColorScheme.of(context).primary),
      title: Row(
        children: [
          Text(title),
          if (titleIcon != null) titleIcon!,
        ],
      ),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onTap,
      trailing: trailing ??
          (isLink == true
              ? const Icon(Icons.launch)
              : const SizedBox()),
    );
  }
}