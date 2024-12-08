import 'package:flutter/material.dart';
import '../../views/profile/profile_screen.dart';
import '../../views/transaction/transaction_view.dart';

class TopNavBar extends StatelessWidget {
  final String title;
  final VoidCallback onMenuPressed;

  const TopNavBar({
    Key? key,
    required this.title,
    required this.onMenuPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: onMenuPressed,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.credit_card, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  static Widget buildDrawer(BuildContext context, bool isSmallScreen) {
    const primaryColor = Color(0xFF5C6BC0); // Matched with dashboard color
    const backgroundColor = Colors.white;

    return Container(
      width: isSmallScreen ? MediaQuery.of(context).size.width * 0.85 : 300,
      child: Drawer(
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF5C6BC0), Colors.white],
            ),
          ),
          child: Column(
              children: [
          Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: primaryColor),
              ),
              const SizedBox(height: 16),
              const Text(
                'Spoozy Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                // Your existing drawer items with updated styling
                _buildAnimatedDrawerItem(
                  context: context,
                  icon: Icons.local_offer_outlined,
                  title: 'Sales',
                  primaryColor: primaryColor,
                  onTap: () {},
                ),
                    _buildAnimatedDrawerItem(
                      context: context,
                      icon: Icons.trending_up_outlined,
                      title: 'Transactions',
                      primaryColor: primaryColor,
                      onTap: () {
                        // Navigate to Transactions page
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>SpozyTransactionPage()),);

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
        )
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
}