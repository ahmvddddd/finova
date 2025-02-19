import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

final List<Map<String, dynamic>> transactionHistoryList = [
  {
    "icon": Iconsax.arrow_down,
    "color": Colors.green[900],
    "transaction_type": "Credit",
    "name": "Janette Doe",
    "amount": "\$1,850.00"
  },
  {
    "icon": Iconsax.bill,
    "color": Colors.blue[900],
    "transaction_type": "Bill",
    "name": "Home Bill",
    "amount": "\$250.00"
  },
  {
    "icon": Iconsax.arrow_down,
    "color": Colors.green[900],
    "transaction_type": "Credit",
    "name": "Najma Ali",
    "amount": "\$5,980.00"
  },
  {
    "icon": Iconsax.arrow_down,
    "color": Colors.red[900],
    "transaction_type": "Debit",
    "name": "Ben Franco",
    "amount": "\$2,000.00"
  },
];