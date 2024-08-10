import 'package:currency_convert_api/function_fetch_and_convert/functions_for_fetch.dart';
import 'package:flutter/material.dart';

class Any_to_Any extends StatefulWidget {
  final currencies;
  final rates;
  Any_to_Any({super.key, this.currencies, this.rates});

  @override
  State<Any_to_Any> createState() => _Any_to_AnyState();
}

class _Any_to_AnyState extends State<Any_to_Any> {
  final currency_1 = TextEditingController();
  final base_one = TextEditingController();
  final final_one = TextEditingController();
  var ans = "Convert any to any currencies";
  var dropdownvalue1 = "AUD";
  var dropdownvalue2 = "AUD";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.currencies);
    print(widget.rates);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: const Color.fromARGB(255, 105, 4, 38),
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
              'Any to Any Currency',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              key: ValueKey('usd'),
              controller: base_one,
              decoration: InputDecoration(hintText: 'Enter base currency'),
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
                        value: dropdownvalue1,
                        icon: const Icon(Icons.arrow_downward_rounded),
                        iconSize: 30,
                        elevation: 20,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: Colors.green,
                        ),
                        items: widget.currencies.keys
                            .toSet()
                            .toList()
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue1 = newValue!;
                          });
                        }),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                      value: dropdownvalue2,
                      icon: Icon(Icons.arrow_downward_rounded),
                      iconSize: 30.1,
                      elevation: 20,
                      isExpanded: true,
                      underline: Container(
                        height: 2,
                        color: Colors.green,
                      ),
                      items: widget.currencies.keys
                          .toSet()
                          .toList()
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? newValue2) {
                        setState(() {
                          dropdownvalue2 = newValue2!;
                        });
                      }),
                )),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  var conveting = converter_any_to_any(widget.rates,
                      base_one.text, dropdownvalue1, dropdownvalue2);
                  setState(() {
                    ans = base_one.text.toString() + ' ${dropdownvalue1.toString()} = '+'${conveting} ${dropdownvalue2.toString()}';
                  });
                },
                child: Center(
                  child: Text(
                    'convert',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20),
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).primaryColorLight))),
            Text(
              ans,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
