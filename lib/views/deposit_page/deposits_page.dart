import 'package:flutter/material.dart';
import '../../widgets/header/BottomNavBar.dart';
import '../../widgets/header/top_nav_bar.dart';
import 'current_deposit_page.dart';
import 'goal_view.dart';

class DepositsPage extends StatefulWidget {
  const DepositsPage({Key? key}) : super(key: key);

  @override
  _DepositsPageState createState() => _DepositsPageState();
}

class _DepositsPageState extends State<DepositsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF5C6BC0),
      drawer: TopNavBar.buildDrawer(context, isSmallScreen),
      body: SafeArea(
        child: Column(
          children: [
            TopNavBar(
              title: 'Deposits',
              onMenuPressed: _toggleDrawer,
            ),
            Expanded(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF5C6BC0), Colors.white],
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildActiveDeposits(),
                      const SizedBox(height: 24),
                      _buildMoneyboxes(),
                      const SizedBox(height: 24),
                      _buildBottomButtons(context),
                      const SizedBox(height: 16),
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
  }

  Widget _buildActiveDeposits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 16),
          child: Text(
            'Active Deposits',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildDepositCard(
                amount: 4000.00,
                date: 'Dec 11, 2022',
                endDate: 'Apr 21, 2023',
                rate: '8%',
              ),
              const Divider(height: 1),
              _buildDepositCard(
                amount: 2660.67,
                date: '4 months',
                rate: '12%',
                earnings: 150.67,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDepositCard({
    required double amount,
    required String date,
    String? endDate,
    required String rate,
    double? earnings,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF5C6BC0).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.account_balance_wallet,
              color: Color(0xFF5C6BC0),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${amount.toStringAsFixed(2)} USD',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1F36),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  rate,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              if (earnings != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    '+\$${earnings.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              if (endDate != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    endDate,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMoneyboxes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 16),
          child: Text(
            'Current Moneyboxes',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        _buildMoneyboxCard(
          'New smartphone',
          800.00,
          800.00,
          true,
        ),
        const SizedBox(height: 12),
        _buildMoneyboxCard(
          'Christmas presents',
          1300.00,
          865.87,
          false,
        ),
      ],
    );
  }

  Widget _buildMoneyboxCard(
      String title,
      double target,
      double current,
      bool achieved,
      ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: (achieved ? Colors.green : const Color(0xFF5C6BC0)).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              achieved ? Icons.check_circle : Icons.savings,
              color: achieved ? Colors.green : const Color(0xFF5C6BC0),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color(0xFF1A1F36),
                    fontWeight: achieved ? FontWeight.normal : FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                if (achieved)
                  Text(
                    'Achieved: \$${target.toStringAsFixed(2)} USD',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current: \$${current.toStringAsFixed(2)} USD',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: current / target,
                          backgroundColor: const Color(0xFF5C6BC0).withOpacity(0.1),
                          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF5C6BC0)),
                          minHeight: 6,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (builder) => GoalView()),
              );
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              '+ Moneybox',
              style: TextStyle(
                color: Color(0xFF5C6BC0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (builder) => CurrentDepositPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: const Color(0xFF5C6BC0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              '+ Deposit',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}