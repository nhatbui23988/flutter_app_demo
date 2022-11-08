import 'package:app_demo/app/presentation/screen/state_demo/state_demo_screen.dart';
import 'package:flutter/material.dart';

class SimpleStatefulWidget extends StatefulWidget {
  final int count;

  SimpleStatefulWidget({Key? key, required this.count}) : super(key: key) {
    print('SimpleStatefulWidget constructor $count');
  }

  @override
  State<SimpleStatefulWidget> createState() {
    print('_SimpleStatefulWidgetState createState()');
    return _SimpleStatefulWidgetState();
  }
}

class _SimpleStatefulWidgetState extends State<SimpleStatefulWidget> {
  int get externalCount => widget.count;
  int internalCount = 0;

  // Create 1
  _SimpleStatefulWidgetState() {
    try {
      print(
          '_SimpleStatefulWidgetState constructor()');
    } catch (e, s) {
      print('SimpleStatefulWidget constructor exception $e $s');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    try {
      print(
          '_SimpleStatefulWidgetState didChangeDependencies() mounted $mounted, context $context');
    } catch (e, s) {
      print('SimpleStatefulWidget didChangeDependencies exception $e $s');
    }
  }

  @override
  void didUpdateWidget(covariant SimpleStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    try {
      print(
          '_SimpleStatefulWidgetState didUpdateWidget() count = ${externalCount}, \noldWidget.count ${oldWidget.count} mounted $mounted, context $context');
    } catch (e, s) {
      print('SimpleStatefulWidget didUpdateWidget exception $e $s');
    }
  }

  @override
  void initState() {
    super.initState();
    try {
      print(
          '_SimpleStatefulWidgetState initState() mounted $mounted, context $context');
    } catch (e, s) {
      print('SimpleStatefulWidget initState exception $e $s');
    }
  }

  // @override
  // void didUpdateWidget(covariant SimpleStatefulWidget oldWidget) {
  //   print('SimpleStatefulWidget didUpdateWidget()');
  //   super.didUpdateWidget(oldWidget);
  //   count = widget.count;
  // }

  @override
  Widget build(BuildContext context) {
    print('SimpleStatefulWidget build() context $context');
    return Scaffold(
      body: SizedBox.expand(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('External Count  ${externalCount}'),
            const SizedBox(
              height: 24,
            ),
            Text('Internal Count ${internalCount}'),

            const SizedBox(
              height: 24,
            ),

            OutlinedButton(onPressed: (){
              setState(() {

              });
              // internalCount++;
              // print('internalCount $internalCount');
              // Future.delayed(const Duration(milliseconds: 1), (){
              //   internalCount++;
              //   print('internalCount $internalCount');
              // });
            }, child: const Text('Increment')),
            OutlinedButton(onPressed: (){
             context.getElementForInheritedWidgetOfExactType<StateDemo>();
            }, child: const Text('Do something'))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    try {
      print(
          'SimpleStatefulWidget dispose() mounted $mounted, context $context');
    } catch (e, s) {
      print('SimpleStatefulWidget dispose exception $e $s');
    }
    super.dispose();
  }
}
