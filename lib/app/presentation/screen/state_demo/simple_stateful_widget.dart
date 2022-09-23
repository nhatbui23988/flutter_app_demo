


import 'package:flutter/material.dart';

class SimpleStatefulWidget extends StatefulWidget {
  final int count;
   SimpleStatefulWidget({Key? key, required this.count}) : super(key: key){
     print('SimpleStatefulWidget constructor $count');
   }

  @override
  State<SimpleStatefulWidget> createState() {
    print('_SimpleStatefulWidgetState createState()');
    return _SimpleStatefulWidgetState();
  }
}

class _SimpleStatefulWidgetState extends State<SimpleStatefulWidget> {
  _SimpleStatefulWidgetState(){
    print('_SimpleStatefulWidgetState constructor()');
  }
  @override
  Widget build(BuildContext context) {
    print('SimpleStatefulWidget build()');
    return  Text('Simple stf widget ${widget.count}');
  }
}
