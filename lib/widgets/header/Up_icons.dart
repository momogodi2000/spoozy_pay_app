import 'package:flutter/material.dart';

import '../../views/profile/profile_screen.dart';

class CustomAnimatedAppBar extends StatefulWidget {
  const CustomAnimatedAppBar({Key? key}) : super(key: key);

  static Widget buildDrawer(BuildContext context, bool isSmallScreen) {
    // SpoozyPay theme colors
    const primaryColor = Color(0xFF0741FF);
    const secondaryColor = Color(0xFF03DAC6);
    const backgroundColor = Color(0xFFF5F5F5);

    return Theme(
      data: Theme.of(context).copyWith(
        drawerTheme: DrawerThemeData(
          backgroundColor: backgroundColor,
          scrimColor: primaryColor.withOpacity(0.3),
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: Drawer(
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Text(
                  'Spoozy Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    _buildAnimatedDrawerItem(
                      context: context,
                      icon: Icons.local_offer_outlined,
                      title: 'Sales',
                      primaryColor: primaryColor,
                      onTap: () {
                        // Navigate to Sales page
                      },
                    ),
                    _buildAnimatedDrawerItem(
                      context: context,
                      icon: Icons.trending_up_outlined,
                      title: 'Transactions',
                      primaryColor: primaryColor,
                      onTap: () {
                        // Navigate to Transactions page
                      },
                    ),
                    _buildAnimatedDrawerItem(
                      context: context,
                      icon: Icons.settings_outlined,
                      title: 'Services',
                      primaryColor: primaryColor,
                      onTap: () {
                        // Navigate to Services page
                      },
                    ),
                    _buildAnimatedDrawerItem(
                      context: context,
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'Magic Wallet',
                      primaryColor: primaryColor,
                      onTap: () {
                        // Navigate to Magic Wallet page
                      },
                    ),
                    _buildAnimatedDrawerItem(
                      context: context,
                      icon: Icons.euro_symbol_outlined,
                      title: 'Angels Fund',
                      primaryColor: primaryColor,
                      onTap: () {
                        // Navigate to Angels Fund page
                      },
                    ),
                    _buildAnimatedDrawerItem(
                      context: context,
                      icon: Icons.monetization_on_outlined,
                      title: 'Sequestered Account',
                      primaryColor: primaryColor,
                      onTap: () {
                        // Navigate to Sequestered Account page
                      },
                    ),
                    _buildAnimatedDrawerItem(
                      context: context,
                      icon: Icons.store_outlined,
                      title: 'Dealer',
                      primaryColor: primaryColor,
                      onTap: () {
                        // Navigate to Dealer page
                      },
                    ),
                    _buildAnimatedDrawerItem(
                      context: context,
                      icon: Icons.attach_money_outlined,
                      title: 'Money Mind',
                      primaryColor: primaryColor,
                      onTap: () {
                        // Navigate to Money Mind page
                      },
                    ),
                    _buildAnimatedDrawerItem(
                      context: context,
                      icon: Icons.work_outline,
                      title: 'Secret Will',
                      primaryColor: primaryColor,
                      onTap: () {
                        // Navigate to Secret Will page
                      },
                    ),
                    _buildAnimatedDrawerItem(
                      context: context,
                      icon: Icons.card_giftcard,
                      title: 'Connected Voucher',
                      primaryColor: primaryColor,
                      onTap: () {
                        // Navigate to Connected Voucher page
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(),
                    ),
                    _buildAnimatedDrawerItem(
                      context: context,
                      icon: Icons.account_circle_outlined,
                      title: 'Spoozy Management',
                      primaryColor: primaryColor,
                      hasDropdown: true,
                      dropdownItems: [
                        _buildDropdownItem(
                          icon: Icons.contacts_outlined,
                          title: 'Contacts',
                          onTap: () {
                            // Navigate to Contacts page
                          },
                        ),
                        _buildDropdownItem(
                          icon: Icons.security_outlined,
                          title: 'Parental Control',
                          onTap: () {
                            // Navigate to Parental Control page
                          },
                        ),
                        _buildDropdownItem(
                          icon: Icons.person_outline,
                          title: 'My Profile',
                          onTap: () {
                            // Navigate to My Profile page
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>ProfileScreen()),);

                          },
                        ),
                      ], onTap: () {  },
                    ),
                    _buildAnimatedDrawerItem(
                      context: context,
                      icon: Icons.settings_outlined,
                      title: 'Spoozy Management',
                      primaryColor: primaryColor,
                      hasDropdown: true,
                      dropdownItems: [
                        _buildDropdownItem(
                          icon: Icons.group_outlined,
                          title: 'Partner Management',
                          onTap: () {
                            // Navigate to Partner Management page
                          },
                        ),
                        _buildDropdownItem(
                          icon: Icons.build_outlined,
                          title: 'Services Management',
                          onTap: () {
                            // Navigate to Services Management page
                          },
                        ),
                        _buildDropdownItem(
                          icon: Icons.history_outlined,
                          title: 'History',
                          onTap: () {
                            // Navigate to History page
                          },
                        ),
                      ], onTap: () {  },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildAnimatedDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Color primaryColor,
    required VoidCallback onTap,
    bool isDestructive = false,
    bool hasDropdown = false,
    List<Widget>? dropdownItems,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset((-30 * (1 - value)), 0),
          child: Opacity(
            opacity: value,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (hasDropdown) {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (_) => Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, -5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ),
                              const SizedBox(height: 16),
                              ...?dropdownItems,
                            ],
                          ),
                        ),
                      );
                    } else {
                      onTap();
                    }
                  },
                  borderRadius: BorderRadius.circular(12),
                  splashColor: primaryColor.withOpacity(0.1),
                  highlightColor: primaryColor.withOpacity(0.05),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              icon,
                              size: 24,
                              color: isDestructive ? Colors.red : primaryColor,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: isDestructive ? Colors.red : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        if (hasDropdown)
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: primaryColor,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildDropdownItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: const Color(0xFF0028EE).withOpacity(0.1),
        highlightColor: const Color(0xFF0741FF).withOpacity(0.05),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: const Color(0xFF0028EE),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<CustomAnimatedAppBar> createState() => _CustomAnimatedAppBarState();
}

class _CustomAnimatedAppBarState extends State<CustomAnimatedAppBar> with SingleTickerProviderStateMixin {
  bool _isMenuPressed = false;
  bool _isCardPressed = false;
  late AnimationController _drawerAnimationController;
  static const primaryColor = Color(0xFF0014EE);
  static const secondaryColor = Color(0xFF03DAC6);

  @override
  void initState() {
    super.initState();
    _drawerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _drawerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final padding = MediaQuery.of(context).padding;
    final isTablet = screenWidth > 600;
    final appBarHeight = (isTablet ? screenHeight * 0.08 : screenHeight * 0.07) + padding.top;

    return Container(
        height: appBarHeight,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
        primaryColor,
        primaryColor.withOpacity(0.9),
    ],
    ),
    borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(isTablet ? 20 : 12),
    ),
    boxShadow: [
    BoxShadow(
    color: primaryColor.withOpacity(0.2),
    blurRadius: 8,
    offset: const Offset(0, 2),
    ),
    ],
    ),
    child: Stack(
    children: [
    Positioned(
    top: padding.top,
    left: 0,
    right: 0,
    bottom: 0,
    child: Padding(
    padding: EdgeInsets.symmetric(
    horizontal: isTablet ? screenWidth * 0.05: 16.0,
    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAnimatedIconButton(
            icon: Icons.menu,
            isPressed: _isMenuPressed,
            onTap: () {
              setState(() {
                _isMenuPressed = true;
              });
              Scaffold.of(context).openDrawer();
              Future.delayed(const Duration(milliseconds: 200), () {
                if (mounted) {
                  setState(() {
                    _isMenuPressed = false;
                  });
                }
              });
            },
          ),
          Row(
            children: [
              Icon(
                Icons.payments_outlined,
                color: Colors.white,
                size: isTablet ? 28 : 24,
              ),
              const SizedBox(width: 8),
              Text(
                'SpoozyPay',
                style: TextStyle(
                  fontSize: isTablet ? 24 : 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          _buildAnimatedIconButton(
            icon: Icons.credit_card,
            isPressed: _isCardPressed,
            onTap: () {
              setState(() {
                _isCardPressed = true;
              });
              Future.delayed(const Duration(milliseconds: 200), () {
                if (mounted) {
                  setState(() {
                    _isCardPressed = false;
                  });
                }
              });
            },
          ),
        ],
      ),
    ),
    ),
    ],
    ),
    );
  }

  Widget _buildAnimatedIconButton({
    required IconData icon,
    required bool isPressed,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isPressed ? Colors.white.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: isPressed ? 0.8 : 1.0, end: isPressed ? 0.8 : 1.0),
          duration: const Duration(milliseconds: 200),
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Icon(
                icon,
                size: 24,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}