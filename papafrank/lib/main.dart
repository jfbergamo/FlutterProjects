// Bergmasco Jacopo, 5AIA, A.S. 2024-2025
// 23/04/2025, FloatingActionButton Multipli
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:papafrank/widget/sballo_button.dart';

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
    int _tentativi = 3;

    final _quiz = [
        {
            'domanda': 'Come si chiama Loris Mandra?',
            'sbagliate': ['Giuseppe', 'Loris', 'Noah'],
            'giusta': 'Gabriel'
        }
    ];
    late int _quizIdx;

    _MyHomePageState() {
        _quizIdx = Random().nextInt(_quiz.length);
    }

    void _right() {
        if (_tentativi > 0) {
            setState(() {
                _answer = 1;
            });
            _quizIdx = Random().nextInt(_quiz.length);
        }
    }

    void _wrong() {
        if (_tentativi > 0) {
            setState(() {
                _answer = -1;
                _tentativi--;
            });
        }
    }
    void _rick() {
        setState(() => _answer = 69);
    }

	@override
	Widget build(BuildContext context) {
		return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
                middle: const Text(title),
                trailing: CupertinoButton(
                    onPressed: () => setState(() => _answer = 0),
                    child: const Icon(Icons.refresh),
                ),
            ),
			child: Center (
                child: Column (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Text(
                            _quiz[_quizIdx]['domanda'] as String
                        ),
                        Column(
                            children:
                                [...(_quiz[_quizIdx]['sbagliate']), _quiz[_quizIdx]['giusta']]).map(
                                    (elem) => SballoButton(text: elem, primary: Colors.amber, background: Colors.deepPurple, action: (elem == _quiz[_quizIdx]['giusta']) ? _right : _wrong)
                                )
                        ),
                        Column(
                            children: <Widget>[
                                if (_answer < 0) Text('Ti restano $_tentativi tentativi!'),
                                if (_answer == 1) const Icon(
                                    Icons.check, 
                                    size: 69.0,
                                    color: Color.fromARGB(255, 0, 255, 0),
                                ),
                                if (_answer == -1) const Icon(
                                    Icons.dangerous, 
                                    size: 69.0,
                                    color: Color.fromARGB(255, 255, 0, 0),
                                ),
                                if (_answer == 69) Image.asset("images/rick.gif")
                            ],
                        )
                    ]
			    ),
			)
		);
	}
}
