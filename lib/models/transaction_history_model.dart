import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

final List<Map<String, dynamic>> transactionHistoryList = [
  {
    "icon": Iconsax.arrow_down,
    "color": Colors.green[900],
    "transaction_type": "Credit",
    "name": "Janette Doe",
    "amount": "\u20A61,850.00"
  },
  {
    "icon": Iconsax.bill,
    "color": Colors.blue[900],
    "transaction_type": "Bill",
    "name": "Home Bill",
    "amount": "\u20A6250.00"
  },
  {
    "icon": Iconsax.arrow_down,
    "color": Colors.green[900],
    "transaction_type": "Credit",
    "name": "Najma Ali",
    "amount": "\u20A65,980.00"
  },
  {
    "icon": Iconsax.arrow_down,
    "color": Colors.red[900],
    "transaction_type": "Debit",
    "name": "Ben Franco",
    "amount": "\u20A62,000.00"
  },
];

final List<String> banks = [
    "Bank of Nigeria",
    "Substandard Bank",
    "Wells Bahago",
    "Ruralbank",
    "MSNBC",
  ];