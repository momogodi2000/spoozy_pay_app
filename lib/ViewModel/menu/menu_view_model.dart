import 'package:flutter/material.dart';
import '../../models/menu/menu_item.dart';

class MenuViewModel extends ChangeNotifier {
  final List<MenuItem> items = [
    MenuItem(title: "Add new card", icon: Icons.credit_card, color: Colors.green.shade100),
    MenuItem(title: "Payment schedule", icon: Icons.calendar_today, color: Colors.blue.shade100),
    MenuItem(title: "Statistics", icon: Icons.bar_chart, color: Colors.red.shade100),
    MenuItem(title: "Scanner QR", icon: Icons.qr_code_scanner, color: Colors.blue.shade100),
    MenuItem(title: "Charity", icon: Icons.favorite, color: Colors.purple.shade100),
    MenuItem(title: "Support", icon: Icons.support_agent, color: Colors.orange.shade100),
    MenuItem(title: "FAQ", icon: Icons.help_outline, color: Colors.yellow.shade100),
    MenuItem(title: "Terms & fees", icon: Icons.article, color: Colors.pink.shade100),
    MenuItem(title: "Privacy policy", icon: Icons.privacy_tip, color: Colors.cyan.shade100),
  ];
}
