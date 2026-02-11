import 'package:arz_app/main.dart';
import 'package:arz_app/model/currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa'), // farsi
      ],
      theme: ThemeData(
        fontFamily: 'dana',

        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: TextStyle(
            fontFamily: "dana",
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),

          headlineSmall: TextStyle(
            fontFamily: "dana",
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

final TextTheme myTextTheme = TextTheme(
  headlineMedium: TextStyle(
    fontFamily: "dana",
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  ),
);

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4),
          child: Container(
            height: 4,
            decoration: BoxDecoration(color: Colors.grey.shade300),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          SizedBox(width: 25),
          Image.asset("assets/images/money.png"),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "قیمت به روز ارز",
              style: TextStyle(color: Colors.black),
            ),
          ),

          Spacer(),

          Image.asset("assets/images/menu.png"),
          SizedBox(width: 25),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/question.png"),

                SizedBox(width: 5),
                Text("نرخ ارز آزاد چیست؟"),
              ],
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              textDirection: TextDirection.rtl,
              " نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.",
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff828282),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              height: 34,
              width: double.infinity,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SizedBox(width: 30),
                  Text(
                    "نام آزاد ارز",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Spacer(),
                  Text(
                    "قیمت",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Spacer(),
                  Text(
                    "تغییر",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(width: 30),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 500,

            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 5,
                  ),
                  child: MyItem(),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: Color(0xffE8E8E8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 154,
                    height: 50,
                    child: TextButton.icon(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          Color(0xffCAC1FF),
                        ),
                      ),
                      onPressed: () {
                        _showSnackBar(context, "بروز رسانی با موفقیت انجام شد");
                      },
                      icon: Icon(
                        color: Colors.black,
                        CupertinoIcons.refresh_bold,
                      ),

                      label: Text(
                        "بروز رسانی",
                        style: TextTheme.of(context).headlineLarge,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text("آخرین بروز رسانی ${_getTime()}"),
                  SizedBox(width: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _getTime() {
  return "20:45";
}

void _showSnackBar(context, msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg, style: TextStyle(fontFamily: "dana")),
      backgroundColor: Colors.green,
    ),
  );
}

class MyItem extends StatelessWidget {
  MyItem({super.key});
  List<Currency> currency = [];

  @override
  Widget build(BuildContext context) {
    currency.add(
      Currency(
        id: "1",
        title: "omid",
        price: "200",
        status: "alo",
        change: "yes",
      ),
    );
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[BoxShadow(blurRadius: 1.0, color: Colors.grey)],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              currency[0].title.toString(),
              style: myTextTheme.headlineMedium,
            ),
            Text(
              currency[0].price.toString(),
              style: myTextTheme.headlineMedium,
            ),
            Text(
              currency[0].change.toString(),
              style: myTextTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
