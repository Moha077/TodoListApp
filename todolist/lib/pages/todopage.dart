import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack( children: <Widget>[
          Container(
            height: 36,
            color:Theme.of(context).accentColor,
          ),
         

          Positioned(
            right: 0,
            child: Text("6",style:TextStyle(fontSize: 200,color:Color(0x10000000))
            )
            ), _mainContent(context),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.settings), onPressed: () {}),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
        ));
  }

  Column _mainContent(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text("Monday",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: _button(context),
          ),
          _taskUncomplet("Call Mohamed about The project"),
           _taskUncomplet("Complete the api"),
            _taskUncomplet("read book"),
             _taskUncomplet("watch serie"),
             Divider(),
             SizedBox(height: 16),
             _taskcomplet("playing tennis"),
             _taskcomplet('writing my lesson')
        ],
      );
  }

  Widget _taskUncomplet(String task) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0,bottom: 24.0),
      child: Row(
        children: [
          Icon(
            Icons.radio_button_unchecked,
            color: Theme.of(context).accentColor,
            size: 20,
          ),
          SizedBox(width: 28),
          Text(task)
        ],
      ),
    );
  }
  
  Widget _taskcomplet(String task) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0,bottom: 24.0),
      child: Row(
        children: [
          Icon(
            Icons.radio_button_checked,
            color: Theme.of(context).accentColor,
            size: 20,
          ),
          SizedBox(width: 28),
          Text(task)
        ],
      ),
    );
  }

  Widget _button(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () {},
            child: Text("Tasks"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0)),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            padding: const EdgeInsets.all(14.0),
          ),
        ),
        SizedBox(width: 32),
        Expanded(
          child: MaterialButton(
            onPressed: () {},
            child: Text("Events"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
                side: BorderSide(color: Theme.of(context).accentColor)),
            color: Colors.white,
            textColor: Theme.of(context).accentColor,
            padding: const EdgeInsets.all(14.0),
          ),
        )
      ],
    );
  }
}
