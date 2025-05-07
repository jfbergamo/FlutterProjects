import 'package:flutter/material.dart';
import 'package:papafrank/widget/sballo_button.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(        
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    var _questionIndex = 0;
  	final questions = [
        {
            'questionText': 'What\'s your favorite color?',
            'answers': ['Black', 'Red', 'Green', 'White'],
            'correct': 'Green',
        },
        {
            'questionText': 'What\'s your favorite animal?',
            'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
            'correct': 'Elephant',
        },
        {
            'questionText': 'Who\'s your favorite ITP instructor?',
            'answers': ['John', 'Carl', 'Kevin', 'James'],
            'correct': 'Kevin',
        },
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.title),
            ),
            body: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                width: double.infinity,
                child: Center(          
                    child: Column(            
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Text(
                                questions[_questionIndex]['questionText'] as String,
                                style: const TextStyle(
                                    fontSize: 30
                                ), 
                            ),
                            ...(questions[_questionIndex]['answers'] as List<String>)
                            .map((answer) {
                                return SballoButton(
                                    text: answer,
                                    action: () {},
                                    background: Colors.lime,
                                    primary: Colors.indigoAccent,
                                );
                            }),
                            SballoButton(
                                text: 'Next',
                                action: () {},
                                background: Colors.cyan,
                                primary: Colors.white,
                            ),
                            if (true) const Text(
                                'Risposta errata!!!',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 236, 12, 12),
                                    fontSize: 50,
                                ),
                            ),
                            if (true) const Text(
                                'Risposta corretta!!!',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 12, 206, 12),
                                    fontSize: 50,
                                ),
                            ),
                            if (true) const Text(
                                'Hai esaurito i tentativi!!!',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 23, 5, 211),
                                    fontSize: 50,
                                ),
                            )
                        ],
                    ),
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {},
                tooltip: 'Increment',
                child: const Icon(Icons.add),
            )
        );
    }
}
