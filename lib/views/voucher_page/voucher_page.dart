
// lib/views/voucher_management_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../ViewModel/voucherr_view_model/voucher_view_model.dart';
import '../../models/voucher_mode/voucher_mode.dart';

class VoucherManagementPage extends StatefulWidget {
  @override
  _VoucherManagementPageState createState() => _VoucherManagementPageState();
}

class _VoucherManagementPageState extends State<VoucherManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VoucherViewModel()..loadVouchers(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Purchase Vouchers'),
          elevation: 0,
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Purchase', icon: Icon(Icons.add_shopping_cart)),
              Tab(text: 'My Vouchers', icon: Icon(Icons.card_giftcard)),
              Tab(text: 'Transfer', icon: Icon(Icons.send)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _PurchaseTab(),
            _VouchersTab(),
            _TransferTab(),
          ],
        ),
      ),
    );
  }
}

class _PurchaseTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final amountController = TextEditingController();

    return Consumer<VoucherViewModel>(
      builder: (context, viewModel, child) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Purchase New Voucher',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: amountController,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          prefixIcon: Icon(Icons.attach_money),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 16),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: viewModel.isLoading
                              ? null
                              : () async {
                            final amount = double.tryParse(amountController.text);
                            if (amount != null) {
                              await viewModel.purchaseVoucher(amount);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Voucher purchased successfully')),
                              );
                              amountController.clear();
                            }
                          },
                          icon: viewModel.isLoading
                              ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(color: Colors.white),
                          )
                              : Icon(Icons.shopping_cart),
                          label: Text('Purchase'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _VouchersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VoucherViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (viewModel.vouchers.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.card_giftcard, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text('No vouchers available'),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: viewModel.vouchers.length,
          itemBuilder: (context, index) {
            final voucher = viewModel.vouchers[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.only(bottom: 16),
              child: InkWell(
                onTap: () => _showVoucherDetails(context, voucher),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${voucher.amount}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Chip(
                            label: Text(voucher.status),
                            backgroundColor: _getStatusColor(voucher.status),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Code: ${voucher.code}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Expires: ${_formatDate(voucher.expiryDate)}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showVoucherDetails(BuildContext context, VoucherModel voucher) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Voucher Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Replace QrImage with QrImageView
            QrImageView(  // Changed from QrImage to QrImageView
              data: voucher.code,
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Implement PDF download
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Downloading PDF...')),
                );
                Navigator.pop(context);
              },
              icon: Icon(Icons.download),
              label: Text('Download PDF'),
            ),
          ],
        ),
      ),
    );
  }
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green[100]!;
      case 'used':
        return Colors.grey[300]!;
      case 'transferred':
        return Colors.blue[100]!;
      default:
        return Colors.grey[300]!;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class _TransferTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipientController = TextEditingController();

    return Consumer<VoucherViewModel>(
      builder: (context, viewModel, child) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transfer Voucher',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Select Voucher',
                          border: OutlineInputBorder(),
                        ),
                        value: viewModel.selectedVoucher.isEmpty ? null : viewModel.selectedVoucher,
                        items: viewModel.vouchers
                            .map((v) => DropdownMenuItem(
                          value: v.id,
                          child: Text('\$${v.amount} - ${v.code}'),
                        ))
                            .toList(),
                        onChanged: (value) => viewModel.selectVoucher(value ?? ''),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: recipientController,
                        decoration: InputDecoration(
                          labelText: 'Recipient ID',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: viewModel.selectedVoucher.isEmpty || viewModel.isLoading
                            ? null
                            : () async {
                          if (recipientController.text.isNotEmpty) {
                            await viewModel.transferVoucher(
                              viewModel.selectedVoucher,
                              recipientController.text,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Voucher transferred successfully')),
                            );
                            recipientController.clear();
                          }
                        },
                        icon: Icon(Icons.send),
                        label: Text('Transfer'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}