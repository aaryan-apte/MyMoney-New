import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  final TextEditingController _textDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('Records'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
          decoration: const BoxDecoration(
            color: Colors.white54,
          ),
          padding: EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.c,
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _textDate,
                decoration: InputDecoration(
                  hintText: 'Select Date',
                  hintStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100),
                  );
                  setState(() {
                    if (date != null) {
                      _textDate.text = "${date.day}-${date.month}-${date.year}";
                    }
                  });
                },
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}
