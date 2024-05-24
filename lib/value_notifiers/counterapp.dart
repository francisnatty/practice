import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter {
  final ValueNotifier<int> count = ValueNotifier<int>(0);

  void incrementCount() {
    count.value++;
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  final Counter counter = Counter();
  final TextEditingController _myController = TextEditingController();
  final TextEditingController _myController2 = TextEditingController();

  @override
  void initState() {
    super.initState();

    _myController.addListener(() {
      setState(() {});
    });
    _myController2.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  bool get allTextFieldNotEmpty =>
      _myController.text.isNotEmpty && _myController2.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier Counter App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _myController,
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.2),
                  hintText: 'Enter First Name',
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 1.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              TextFormField(
                controller: _myController2,
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.2),
                  hintText: 'Enter Last Name',
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 1.0),
                  ),
                ),
              ),
              const Text('Count'),
              ValueListenableBuilder<int>(
                  valueListenable: counter.count,
                  builder: (BuildContext context, int value, child) {
                    return Text(
                      '$value',
                      style: Theme.of(context).textTheme.headlineLarge,
                    );
                  }),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (allTextFieldNotEmpty)
                        ? Colors.purple
                        : Colors.purple.withOpacity(0.2),
                  ),
                  onPressed: () {},
                  child: const Text('Test'))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.incrementCount();
        },
        tooltip: 'Increment',
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
