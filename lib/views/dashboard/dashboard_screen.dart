import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/dashbaord/dashboard_viewmodel.dart';
import '../../widgets/dashboard/account_balance_card.dart';
import '../../widgets/dashboard/transaction_list_item.dart';
import 'package:flutter/material.dart';
import '../../widgets/header/BottomNavBar.dart';
import '../../widgets/header/Up_icons.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;
        final padding = isSmallScreen ? 16.0 : 24.0;

        return Scaffold(
          backgroundColor: const Color(0xFFF5F6FA),
          drawer: CustomAnimatedAppBar.buildDrawer(context, isSmallScreen),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: const CustomAnimatedAppBar(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          _buildBalanceCards(context, isSmallScreen),
                          const SizedBox(height: 24),
                          _buildTransactionsList(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const AnimatedBottomNavBar(),
        );
      },
    );
  }


  Widget _buildBalanceCards(BuildContext context, bool isSmallScreen) {
    final accounts = [
      {'title': 'Real Account', 'amount': '50,000', 'icon': Icons.account_balance_wallet},
      {'title': 'Blockchain', 'amount': '5,000', 'icon': Icons.sync_alt},
      {'title': 'Virtual', 'amount': '5,000', 'icon': Icons.shopping_bag},
    ];

    return SingleChildScrollView(
      scrollDirection: isSmallScreen ? Axis.horizontal : Axis.vertical,
      child: isSmallScreen
          ? Row(
        children: accounts.map((account) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: AccountBalanceCard(
              title: account['title'] as String,
              amount: account['amount'] as String,
              icon: account['icon'] as IconData,
            ),
          );
        }).toList(),
      )
          : Column(
        children: accounts.map((account) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: AccountBalanceCard(
              title: account['title'] as String,
              amount: account['amount'] as String,
              icon: account['icon'] as IconData,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTransactionsList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Mobile Money Transactions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View all'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Consumer<DashboardViewModel>(
          builder: (context, viewModel, _) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: viewModel.recentTransactions.length,
              itemBuilder: (context, index) {
                return TransactionListItem(
                  transaction: viewModel.recentTransactions[index],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
