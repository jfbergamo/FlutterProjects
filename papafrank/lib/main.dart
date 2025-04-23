// Bergmasco Jacopo, 5AIA, A.S. 2024-2025
// 23/04/2025, FloatingActionButton Multipli
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
	runApp(const MyApp());
}

const title = "Pippo LoSballo";

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
	int _answer = 0;

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
                        const Text(
                            "Qual e' il miglior linguaggio di programmazione della storia?"
                        ),
                        Column(
                            children: <Widget>[
                                CupertinoButton(
                                    child: const Text('Java'), 
                                    onPressed: () => setState(() => _answer = -1)
                                ),
                                CupertinoButton(
                                    child: const Text('PHP'), 
                                    onPressed: () => setState(() => _answer = -1)
                                ),
                                CupertinoButton(
                                    child: const Text('C#'), 
                                    onPressed: () => setState(() => _answer = -1)
                                ),
                                CupertinoButton(
                                    child: const Text('Noah Santin'), 
                                    onPressed: () => setState(() => _answer = 1)
                                ),
                            ]
                        ),
                        Column(
                            children: <Widget>[
                                if (_answer > 0) const Icon(
                                    Icons.check, 
                                    size: 69.0,
                                    color: Color.fromARGB(255, 0, 255, 0),
                                ),
                                if (_answer < 0) const Icon(
                                    Icons.dangerous, 
                                    size: 69.0,
                                    color: Color.fromARGB(255, 255, 0, 0),
                                )
                            ],
                        )
                    ]
			    ),
			)
		);
	}
}
