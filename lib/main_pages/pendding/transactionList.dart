import 'package:flutter/material.dart';
import 'package:money_lover/common/color_extension.dart';
import 'package:money_lover/home/home_view.dart';
import 'package:money_lover/main_pages/pendding/pendding.dart';
class Transaction {
  final String title;
  final double amount;
  final DateTime date;

  Transaction({required this.title, required this.amount, required this.date});
}


class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _transactions = [];
  double? _devHeight, _devWidth;
  void _addTransaction(Transaction transaction) {
    setState(() {
      _transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    _devHeight = MediaQuery.of(context).size.height;
    _devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: TColor.gray80,
      appBar: AppBar(
        backgroundColor: TColor.gray80,
        title: Image.asset(
          "assets/img/app_logo.png",
          width: _devWidth! * 0.4,
          fit: BoxFit.contain,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                final transaction = _transactions[index];
                return ListTile(
                  title: Text(transaction.title),
                  subtitle: Text(
                    'Số tiền: ${transaction.amount}, Ngày: ${transaction.date.toLocal()}'.split(' ')[0],
                  ),
                );
              },
            ),
          ),
          // ElevatedButton(
          //   onPressed: () async {
          //     final result = await Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => AddTransactionForm()),
          //     );
          //     if (result != null) {
          //       _addTransaction(result as Transaction);
          //     }
          //   },
          //   child: Text('Thêm Giao Dịch'),
          //   style: ElevatedButton.styleFrom(
          //     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
