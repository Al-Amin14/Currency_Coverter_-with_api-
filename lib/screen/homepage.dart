import 'package:currency_convert_api/function_fetch_and_convert/functions_for_fetch.dart';
import 'package:currency_convert_api/models/fetching_chracters.dart';
import 'package:currency_convert_api/screen/anytoany.dart';
import 'package:currency_convert_api/screen/ucdtoany.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage_currency extends StatefulWidget {
  const HomePage_currency({super.key});

  @override
  State<HomePage_currency> createState() => _HomePage_currencyState();
}

class _HomePage_currencyState extends State<HomePage_currency> {
  late final result_rate;
  late final allcurrencies;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      result_rate = fetchlatest();
      allcurrencies = fetchcurrencies();
    });
    print(result_rate);
    print(allcurrencies);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          backgroundColor: Color.fromARGB(255, 9, 66, 50),
          centerTitle: true,
          title: Text(
            'Open Exchange Flutter',
            style: TextStyle(
                fontFamily: "Schyler",
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.jpg'), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: FutureBuilder<LatestConvert>(
                future: result_rate,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Center(
                    child: FutureBuilder<Map>(
                        future: allcurrencies,
                        builder: (context, currsnapshot) {
                          if (currsnapshot.connectionState ==
                              ConnectionState.waiting)
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: width,
                                height: height * 0.4,
                                child: usd_to_any(
                                  curriencies: currsnapshot.data,
                                  rates: snapshot.data!.rates,
                                ),
                              ),
                              Container(
                                width: width,
                                height: height * 0.4,
                                child: Any_to_Any(
                                  currencies: currsnapshot.data,
                                  rates: snapshot.data!.rates,
                                ),
                              ),
                            ],
                          );
                        }),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
