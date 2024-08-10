import 'dart:convert';

import 'package:currency_convert_api/function_fetch_and_convert/functions_for_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class usd_to_any extends StatefulWidget {
  final curriencies;
  final rates;
  usd_to_any({super.key, required this.curriencies, this.rates});

  @override
  State<usd_to_any> createState() => usd_to_anyState();
}

class usd_to_anyState extends State<usd_to_any> {
  void initState() {
    super.initState();
    print('_______________________________________________________________________');
    print(widget.rates);
    print('_______________________________________________________________________');
    print(widget.curriencies);
  }

  final ucd_cr = TextEditingController();
  var dropdownvalue = 'AUD';
  var ans = 'Converted Currencey will be shown here :-)';
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors:[
            Color.fromARGB(255, 6, 118, 118),Color.fromARGB(255, 8, 78, 45)
            ],
            ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'USD to Any Currency',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              key: const ValueKey('usd'),
              controller: ucd_cr,
              decoration: InputDecoration(hintText: 'Enter USD'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                        value: dropdownvalue,
                        icon: const Icon(Icons.arrow_downward_rounded),
                        iconSize: 30,
                        elevation: 20,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: Colors.green,
                        ),
                        items: widget.curriencies.keys
                            .toSet()
                            .toList()
                            .map<DropdownMenuItem<String>>((value) {
                          return  DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        }),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ans = ucd_cr.text +
                            'USD = ' +
                            ConverterUsd(
                                widget.rates, ucd_cr.text, dropdownvalue);
                      });
                    },
                    child: Text(
                      'Convert',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            Theme.of(context).primaryColorLight)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(child: Text(ans)),
          ],
        ),
      ),
    );
  }
}
