import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  TransactionItem(
    this._userTransactions,
    this.removeTransaction,
  );

  final Transaction _userTransactions;
  final Function removeTransaction;

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
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text('\₱${_userTransactions.amount}')),
          ),
        ),
        title: Text(
          _userTransactions.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(_userTransactions.date)),
        trailing: MediaQuery.of(context).size.width >= 460
            ? ElevatedButton.icon(
                onPressed: () {
                  removeTransaction(_userTransactions.id);
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
                  removeTransaction(_userTransactions.id);
                },
              ),
      ),
    );
  }
}
