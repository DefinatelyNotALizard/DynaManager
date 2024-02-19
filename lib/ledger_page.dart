import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'globals.dart';
import 'finance_pie.dart';

void getPro() {
  //Get Pro
}

class LedgerPage extends StatefulWidget {
  const LedgerPage({super.key});

  @override
  State<LedgerPage> createState() => _LedgerPageState();
}

class _LedgerPageState extends State<LedgerPage> {
  Color currentColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
              child: Column(children: [
            Expanded(
              child: ListView.builder(
                  itemCount: transactionNames.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.fromLTRB(30, 20, 3, 20),
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              /* width: MediaQuery.of(context).size.width *
                          widthMultiplier *
                          0.4, */
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: containerColor,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [PieWithHole()],
                                  )
                                ],
                              ))
                        ],
                      );
                    } else {
                      if (transactionTypes[index - 1] == 'R') {
                        currentColor = Colors.green;
                      } else if (transactionTypes[index - 1] == 'P') {
                        currentColor = Colors.red;
                      } else if (transactionTypes[index - 1] == 'I') {
                        currentColor = Colors.blue;
                      }

                      return Padding(
                          padding: EdgeInsets.fromLTRB(30, 20, 3, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: LinearGradient(
                                colors: [Colors.white, currentColor],
                                begin: Alignment.center,
                                end: Alignment.centerRight,
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(
                                  transactionNames[index - 1],
                                  style: defaultText,
                                ),
                                Spacer(),
                                Text(
                                  transactionNumbers[index - 1].toString(),
                                  style: defaultText,
                                ),
                              ],
                            ),
                          ));
                    }
                  }),
            ),
          ])),
          Column(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 10, 20),
                child: FloatingActionButton(
                  backgroundColor: dynamiteRed,
                  child: Icon(
                    Icons.add,
                    size: iconSize,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return TransactionDialogue();
                        });
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class NetWorth extends StatefulWidget {
  const NetWorth({Key? key}) : super(key: key);

  @override
  State<NetWorth> createState() => _NetWorthState();
}

class _NetWorthState extends State<NetWorth> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(30, 20, 3, 20),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        width: MediaQuery.of(context).size.width * widthMultiplier * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: containerColor,
        ),
        child: Column(
          children: [
            Icon(
              Icons.home,
              size: iconSize,
              color: Colors.black,
            ),
          ],
        ));
  }
}

class TransactionDialogue extends StatefulWidget {
  const TransactionDialogue({Key? key}) : super(key: key);

  @override
  State<TransactionDialogue> createState() => _TransactionDialogueState();
}

class _TransactionDialogueState extends State<TransactionDialogue> {
  TextEditingController _textEditingController = TextEditingController();
  String transactionType = 'def';
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: containerColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.all(7.5),
            child: Column(children: [
              Text(
                "New transaction",
                style: titleText,
              ),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        transactionType = 'pay';
                      });
                      print(transactionType);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: transactionType == 'def' ||
                                  transactionType == 'pay'
                              ? Colors
                                  .blueAccent // Change this to your desired outline color
                              : Colors
                                  .transparent, // No outline for other cases
                          width:
                              5.0, // Adjust the width of the outline as needed
                        ),
                      ),
                      margin: EdgeInsets.all(10),
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Icon(Icons.payments, size: iconSize * 5),
                              Text(
                                "Payment",
                                style: defaultTextWhite,
                              )
                            ],
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        transactionType = 'rec';
                      });
                      print(transactionType);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: transactionType == 'rec'
                                ? Colors
                                    .blueAccent // Change this to your desired outline color
                                : Colors
                                    .transparent, // No outline for other cases
                            width:
                                5.0, // Adjust the width of the outline as needed
                          ),
                        ),
                        margin: EdgeInsets.all(10),
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Icon(Icons.receipt, size: iconSize * 5),
                                Text(
                                  "Receipt",
                                  style: defaultTextWhite,
                                )
                              ],
                            ))),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        transactionType = 'inv';
                      });
                      print(transactionType);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: transactionType == 'inv'
                                ? Colors
                                    .blueAccent // Change this to your desired outline color
                                : Colors
                                    .transparent, // No outline for other cases
                            width:
                                5.0, // Adjust the width of the outline as needed
                          ),
                        ),
                        margin: EdgeInsets.all(10),
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Icon(Icons.work, size: iconSize * 5),
                                Text(
                                  "Investment",
                                  style: defaultTextWhite,
                                )
                              ],
                            ))),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          transactionType = 'loa';
                        });
                        print(transactionType);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: transactionType == 'loa'
                                  ? Colors
                                      .blueAccent // Change this to your desired outline color
                                  : Colors
                                      .transparent, // No outline for other cases
                              width:
                                  5.0, // Adjust the width of the outline as needed
                            ),
                          ),
                          margin: EdgeInsets.all(10),
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Icon(Icons.account_balance,
                                      size: iconSize * 5),
                                  Text(
                                    "Loan",
                                    style: defaultTextWhite,
                                  )
                                ],
                              )))),
                  Spacer(),
                ],
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: Column(
                    children: [
                      /* Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey, // Change this to your desired background color
                            hintText: 'Name',
                          ),
                        ),
                      ), */
                      Row(
                        children: [
                          /* Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: TextField(
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors
                                    .grey, // Change this to your desired background color
                                hintText: 'Amount',
                              ),
                            ),
                          ), */
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextField(
                              style: defaultText,
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      inputGrey, // Change this to your desired background color
                                  hintText: 'Name',
                                  hintStyle: defaultText),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            height: 46,
                            width: MediaQuery.of(context).size.width * 0.2,
                            //padding: const EdgeInsets.all(16.0),
                            child: NumberInputBox(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: TextButton(
                                onPressed: () {
                                  transactionNames
                                      .add(_textEditingController.text);
                                  print("Confirmed");
                                  Navigator.pop(context);
                                },
                                child: Text('Confirm')),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: TextButton(
                                onPressed: () {
                                  transactionType = 'def';
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel')),
                          )
                        ],
                      ),
                    ],
                  ))
            ]),
          );
        }));
  }
}

class NumberInputBox extends StatefulWidget {
  @override
  _NumberInputBoxState createState() => _NumberInputBoxState();
}

class _NumberInputBoxState extends State<NumberInputBox> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: defaultText,
      keyboardType:
          TextInputType.numberWithOptions(decimal: true, signed: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
        // This regex allows only digits and an optional decimal point with up to 2 decimal places
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: inputGrey,
        //labelText: 'Enter a number',
        hintText: 'Amount',
        hintStyle: defaultText,

        border: OutlineInputBorder(),
      ),
    );
  }
}
