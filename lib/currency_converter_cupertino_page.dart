import 'package:flutter/cupertino.dart';
// Still needed for some widgets like TextEditingController

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  _CurrencyConverterCupertinoPageState createState() => _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState extends State<CurrencyConverterCupertinoPage> {
  double result = 0; // Declare result as a state variable
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      // Use tryParse to avoid crashes on invalid input
      double? input = double.tryParse(textEditingController.text);
      if (input != null) {
        result = input * 10.5;
      } else {
        result = 0; // Handle invalid input gracefully
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Currency Converter'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SEK ${result.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextField(
                controller: textEditingController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                placeholder: 'Please enter the amount in USD',
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.money_dollar),
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton.filled(
                onPressed: convert,
                child: const Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
