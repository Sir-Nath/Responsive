import 'package:flutter/material.dart';
import 'package:responsiveness_practice/responsiveness.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsiveness'),
        centerTitle: true,
      ),
      body: Responsive(
        desktop: Container(),
        mobile: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              containerOne(context),
              containerOne(context),
              containerOne(context),
              containerTwo(),
              containerTwo(),
              containerTwo(),
              containerTwo(),
            ],
          ),
        ),
        tablet: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    containerOne(context),
                    containerOne(context),
                    containerOne(context),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    containerTwo(),
                    containerTwo(),
                    containerTwo(),
                    containerTwo(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container containerTwo() {
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Container containerOne(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Responsive.isMobile(context) ? Colors.green : Colors.purple,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
