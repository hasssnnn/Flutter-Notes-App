import 'package:flutter/material.dart';

import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          const SizedBox(
            height: 80,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Libre Baskerville'),
          ),
          const Spacer(),
          CustomIcon(
            onTap: onTap,
            icon: icon,
          )
        ],
      ),
    );
  }
}
