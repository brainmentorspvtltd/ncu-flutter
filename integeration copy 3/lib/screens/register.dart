import 'package:flutter/material.dart';

class RegisterDemo extends StatefulWidget {
  @override
  _RegisterDemoState createState() => _RegisterDemoState();
}

class _RegisterDemoState extends State<RegisterDemo> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _course;
  String _selectedHobbies = "";
  Map<String, bool> hobbies;
  Map<String, bool> options;
  String _group = "q1";
  String _selectedAns = "";
  Map<String, bool> getHobbies() {
    return {"Cricket": false, "FootBall": false};
  }

  Map<String, bool> getOptions() {
    return {
      "Java Virtual Machine": true,
      "Java Vital Machine": false,
      "Both a and b": false,
      "None of These": false
    };
  }

  List<String> getCourses() {
    return [
      "Java",
      "Dart",
      "JavaScript",
      "Node",
      "Redux",
      "TypeScript",
      "VueJS",
      "ReactJS",
      "Flutter"
    ];
  }

  _validateTxt(String val) {
    if (val.isEmpty) {
      return "Please Enter your Name";
    }
    return null;
  }

  _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        msg =
            _name + " " + _selectedAns + " " + _course + " " + _selectedHobbies;
      });
    }
  }

  String msg = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.hobbies = getHobbies();
    this.options = getOptions();
  }

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Demo'),
      ),
      body: Container(
          child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            Text(
              msg,
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              onSaved: (value) {
                _name = value;
              },
              validator: (String val) {
                return _validateTxt(val);
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.deepOrange))),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              onChanged: (String val) {
                setState(() {
                  _course = val;
                });
              },
              value: _course,
              onSaved: (String val) {
                _course = val;
              },
              isExpanded: true,
              items: getCourses().map((course) {
                return DropdownMenuItem<String>(
                  value: course,
                  child: Text(
                    course,
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              hint: Center(
                child: Text('Select Course'),
              ),
              validator: (value) {
                if (value == null) {
                  return "Must Select a One Course";
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: hobbies.keys.map((String key) {
                return ListTile(
                  title: Text(
                    key,
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Checkbox(
                    onChanged: (bool val) {
                      if (val == true) {
                        hobbies[key] = val;
                        setState(() {
                          print(
                              "Selected Hobbies $_selectedHobbies and Key is $key");
                          print("H Key ${hobbies[key]}");
                          _selectedHobbies += key;
                        });
                      }
                    },
                    value: hobbies[key],
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: options.keys.map((String key) {
                counter++;
                return RadioListTile(
                  value: key,
                  groupValue: _selectedAns,
                  onChanged: (val) {
                    setState(() {
                      print("On change Value is $val");
                      _selectedAns = key;
                    });
                  },
                  title: Text(
                    key,
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              child: Text(
                'Register',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.orange,
              onPressed: () {
                _submitForm();
              },
            )
          ],
        ),
      )),
    );
  }
}
