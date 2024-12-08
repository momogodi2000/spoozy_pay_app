// lib/views/goal_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/deposits/goal_viewmodel.dart';

class GoalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GoalViewModel(),
      child: GoalScreen(),
    );
  }
}

class GoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildGoalSection(),
                _buildAmountSection(),
                _buildCardSection(),
                _buildDailyAmountSection(),
                _buildRoundingSection(),
                _buildActionButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GOAL',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter your goal',
            border: UnderlineInputBorder(),
            hintStyle: TextStyle(color: Colors.grey[400]),
          ),
        ),
      ],
    );
  }

  Widget _buildAmountSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AMOUNT TO ACHIEVE',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              prefixText: ' ',
              hintText: '1300',
              border: UnderlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  Widget _buildCardSection() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'USE CARD',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCardItem(true),
                SizedBox(width: 16),
                _buildCardItem(false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardItem(bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey[300]!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/visa_logo.png', height: 20),
          SizedBox(width: 8),
          Text('**** 7056'),
        ],
      ),
    );
  }

  Widget _buildDailyAmountSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AMOUNT PER DAY',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              prefixText: ' ',
              hintText: '10',
              border: UnderlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  Widget _buildRoundingSection() {
    return Consumer<GoalViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            _buildRoundingOption(
              'Rounding up to 1 per transaction.',
              viewModel.goal.isRoundingToOne,
                  () => viewModel.toggleRoundingToOne(),
            ),
            SizedBox(height: 8),
            _buildRoundingOption(
              'Rounding up to 10 per transaction.',
              viewModel.goal.isRoundingToTen,
                  () => viewModel.toggleRoundingToTen(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRoundingOption(String text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey[400]!,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            )
                : null,
          ),
          SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Open Moneybox',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[700],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}