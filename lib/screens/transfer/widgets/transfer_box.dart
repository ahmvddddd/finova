// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:number2words/number2words.dart';
import 'package:intl/intl.dart';

class TransferBox extends StatefulWidget {
  const TransferBox({super.key});

  @override
  _AmountToWordsPageState createState() => _AmountToWordsPageState();
}

class _AmountToWordsPageState extends State<TransferBox> {
  String _amountInWords = '';
  final TextEditingController _controller = TextEditingController();
  final NumberFormat _formatter = NumberFormat('#,##0.##');

  void _convertAmountToWords(String value) {
    if (value.isEmpty) {
      setState(() {
        _amountInWords = '';
      });
      return;
    }

    // Remove commas and convert the value to a double
    final double? amount = double.tryParse(value.replaceAll(',', ''));
    if (amount == null) {
      setState(() {
        _amountInWords = 'Invalid number';
      });
      return;
    }

    // Format the number with commas
    String formattedValue = _formatter.format(amount);
    _controller.value = TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );

    // Convert the amount to words
    setState(() {
      _amountInWords = '${Number2Words.convert(amount)} ';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration:  InputDecoration(
              hintText: 'Enter Amount',
              hintStyle: Theme.of(context).textTheme.labelSmall,
              border: const OutlineInputBorder(),
            ),
            onChanged: _convertAmountToWords,
          ),
          const SizedBox(height: 20),
          Text(
            _amountInWords,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      );
  }
}
