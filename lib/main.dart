import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      data: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 19.43,
      data: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart!'),
              color: Colors.blue,
              elevation: 5,
            ),
          ),
          Column(
            children: [
              ...transactions
                  .map(
                    (transaction) => Card(
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              '\$${transaction.amount}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.purple,
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transaction.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                transaction.data.toString(),
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      elevation: 5,
                    ),
                  )
                  .toList()
            ],
          ),
        ],
      ),
    );
  }
}
