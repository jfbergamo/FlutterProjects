import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
	runApp(const MyApp());
}

const title = "Ciao Prof Basso!";

class MyApp extends StatelessWidget {
	const MyApp({super.key});


	@override
	Widget build(BuildContext context) {
		return const CupertinoApp(
			title: title,
			home: MyHomePage(title: title),
		);
	}
}

class MyHomePage extends StatefulWidget {
	const MyHomePage({super.key, required this.title});

	final String title;

	@override
	State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	int _counter = 0;
    String _incrementTxt = "Impreca!";
    String _decrementTxt = "Santificati!";

	@override
	Widget build(BuildContext context) {
		return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
                middle: Text(title),
            ),
			child: Center (
                child: Column (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Column(
                            children: <Widget>[
                                const Text(
                                    'Oggi hai imprecato',
                                ),
                                Text(
                                    '$_counter',
                                    style: Theme.of(context).textTheme.headlineMedium,
                                ),
                                const Text(
                                    'volte!',
                                ),
                            ]
                        ),
                        Column(
                            children: <Widget>[
                                CupertinoButton(
                                    onPressed: () => setState(() {
                                            _counter++;
                                            if (_counter > 0) {
                                                _incrementTxt = "Impreca ancora!";
                                                _decrementTxt = "Confessati!";
                                            }
                                        }),
                                    child: Text(_incrementTxt)
                                ),
                                CupertinoButton (
                                    onPressed: () => setState(() {
                                        _counter--;
                                        if (_counter <= 0) {
                                            _incrementTxt = "Impreca!";
                                            _decrementTxt = "Santificati!";
                                        }
                                    }),
                                    child: Text(_decrementTxt)
                                ),
                            ]
                        )
                    ]
			    ),
			)
		);
	}
}
