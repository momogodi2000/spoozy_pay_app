// lib/viewmodels/voucher_viewmodel.dart
import 'package:flutter/material.dart';

import '../../models/voucher_mode/voucher_mode.dart';

class VoucherViewModel extends ChangeNotifier {
  List<VoucherModel> _vouchers = [];
  bool _isLoading = false;
  String _selectedVoucher = '';

  List<VoucherModel> get vouchers => _vouchers;
  bool get isLoading => _isLoading;
  String get selectedVoucher => _selectedVoucher;

  Future<void> loadVouchers() async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(Duration(seconds: 1));
    _vouchers = [
      VoucherModel(
        id: '1',
        amount: 50.0,
        code: 'VOUCHER50',
        expiryDate: DateTime.now().add(Duration(days: 30)),
        status: 'active',
        ownerId: 'current_user',
      ),
      VoucherModel(
        id: '2',
        amount: 100.0,
        code: 'VOUCHER100',
        expiryDate: DateTime.now().add(Duration(days: 60)),
        status: 'active',
        ownerId: 'current_user',
      ),
    ];

    _isLoading = false;
    notifyListeners();
  }

  Future<void> purchaseVoucher(double amount) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(Duration(seconds: 2));

    _vouchers.add(
      VoucherModel(
        id: DateTime.now().toString(),
        amount: amount,
        code: 'VOUCHER${amount.toInt()}',
        expiryDate: DateTime.now().add(Duration(days: 90)),
        status: 'active',
        ownerId: 'current_user',
      ),
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> transferVoucher(String voucherId, String recipientId) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(Duration(seconds: 1));

    final index = _vouchers.indexWhere((v) => v.id == voucherId);
    if (index != -1) {
      _vouchers.removeAt(index);
    }

    _isLoading = false;
    notifyListeners();
  }

  void selectVoucher(String id) {
    _selectedVoucher = id;
    notifyListeners();
  }
}
