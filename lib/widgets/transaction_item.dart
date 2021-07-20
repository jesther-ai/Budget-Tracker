import 'Dart:math';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    required Key key,
    required this.userTransactions,
    required this.removeTransaction,
  }) : super(key: key);

  final Transaction userTransactions;
  final Function removeTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late Color _bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.pink,
      Colors.purple,
    ];
    _bgColor = availableColors[Random().nextInt(availableColors.length) - 1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child:
                FittedBox(child: Text('\₱${widget.userTransactions.amount}')),
          ),
        ),
        title: Text(
          widget.userTransactions.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(widget.userTransactions.date)),
        trailing: MediaQuery.of(context).size.width >= 460
            ? ElevatedButton.icon(
                onPressed: () {
                  widget.removeTransaction(widget.userTransactions.id);
                },
                icon: Icon(Icons.remove),
                label: Text('Delete'),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(Theme.of(context).errorColor),
                ),
              )
            : IconButton(
                icon: Icon(Icons.remove),
                color: Theme.of(context).errorColor,
                onPressed: () {
                  widget.removeTransaction(widget.userTransactions.id);
                },
              ),
      ),
    );
  }
}
