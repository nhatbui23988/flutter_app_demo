import 'package:app_demo/app/presentation/screen/state_demo/simple_stateful_widget.dart';
import 'package:flutter/material.dart';

class StateDemo extends StatefulWidget {
  const StateDemo({Key? key}) : super(key: key);

  @override
  State<StateDemo> createState() => _StateDemoState();
}

class _StateDemoState extends State<StateDemo> {
  UniqueKey _widgetKey = UniqueKey();
  int count = 0;
  @override
  Widget build(BuildContext context) {
    print('_StateDemoState build()');
    return Scaffold(body: Column(
      children: [
        Expanded(
            child: Center(
              child: SimpleStatefulWidget(count: count,),
            )),
        Padding(
            padding: EdgeInsets.all(40) ,
            child: OutlinedButton(
              onPressed: (){
                setState(() {
                  count++;
                });
              },
              child: Text('Rebuild'),
            ))
      ],
    ));
  }
}
