import 'package:flutter/material.dart';
import '../../views/MenuCard/more_screen.dart';
import '../../views/dashboard/main_dashboard.dart';
import '../../views/deposit_page/deposits_page.dart';
import '../../views/loan/loan_list_screen.dart';

class AnimatedBottomNavBar extends StatefulWidget {
  const AnimatedBottomNavBar({Key? key}) : super(key: key);

  @override
  State<AnimatedBottomNavBar> createState() => _AnimatedBottomNavBarState();
}

class _AnimatedBottomNavBarState extends State<AnimatedBottomNavBar> {
  int _selectedIndex = 0;

  final List<NavItem> _navItems = [
    NavItem(Icons.dashboard_outlined, 'Dashboard'),
    NavItem(Icons.account_balance, 'Deposits'),
    NavItem(Icons.account_balance_wallet_outlined, 'Loans'),
    NavItem(Icons.notifications_outlined, 'Notifications'),
    NavItem(Icons.more_horiz, 'More'),
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final bottomPadding = mediaQuery.padding.bottom;
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    // Responsive breakpoints
    final isSmallScreen = screenWidth < 360;
    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 1200;

    // Adjusted sizes to prevent overflow
    final double iconSize = isSmallScreen ? 20 : isTablet ? 26 : 22;
    final double fontSize = isSmallScreen ? 10 : isTablet ? 12 : 11;
    final double horizontalPadding = isDesktop
        ? screenWidth * 0.15
        : isTablet
        ? screenWidth * 0.1
        : 12;
    final double itemPadding = isSmallScreen ? 6 : 8;

    // Fixed height calculation to prevent overflow
    final double baseHeight = isLandscape ? 50 : 56;
    final double navBarHeight = baseHeight + bottomPadding;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: navBarHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 4, // Reduced vertical padding
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _navItems.asMap().entries.map((entry) {
                    return Flexible(
                      child: _buildNavItem(
                        entry.key,
                        entry.value.icon,
                        entry.value.label,
                        iconSize: iconSize,
                        fontSize: fontSize,
                        itemPadding: itemPadding,
                        constraints: constraints,
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      int index,
      IconData icon,
      String label, {
        required double iconSize,
        required double fontSize,
        required double itemPadding,
        required BoxConstraints constraints,
      }) {
    final isSelected = _selectedIndex == index;
    final availableWidth = constraints.maxWidth / _navItems.length;
    final showLabel = availableWidth >= 50;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          if (index == 2) {
            // Navigate to LoanListScreen when the Loans icon is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LoanListScreen()),
            );
          } else if (index == 4) {
            // Navigate to MoreScreen when the More icon is tapped
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MoreScreen()),
            );
          }
          else if (index == 0) {
            // Navigate to Dashboard when the More icon is tapped
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MainDashboard()),
            );
          }

          else if (index == 1) {
            // Navigate to deposits when the More icon is tapped
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => DepositsPage()),
            );
          }


        });
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: availableWidth,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: itemPadding,
            vertical: itemPadding / 2,
          ),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.blue : Colors.grey,
                size: iconSize,
              ),
              if (showLabel) ...[
                SizedBox(height: 2), // Reduced spacing
                Text(
                  label,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: isSelected ? Colors.blue : Colors.grey,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem {
  final IconData icon;
  final String label;

  NavItem(this.icon, this.label);
}
