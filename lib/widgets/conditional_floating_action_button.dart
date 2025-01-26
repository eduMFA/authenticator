import 'package:flutter/material.dart';

class ConditionalFloatingActionButton extends StatelessWidget {
  final bool isExtended;
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  const ConditionalFloatingActionButton({required this.isExtended, required this.label, required this.icon, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) => isExtended
      ? FloatingActionButton.extended(
        label: Text(label),
        icon: Icon(icon),
        onPressed: onPressed,
      )
      : FloatingActionButton(
        onPressed: onPressed,
        tooltip: label,
        child: Icon(icon)
      );
}