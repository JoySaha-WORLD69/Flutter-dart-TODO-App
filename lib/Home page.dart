import 'package:flutter/material.dart';
import 'package:todofirbase/Container.dart';

// ignore: must_be_immutable
class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController _controller = TextEditingController();

  List toto = [
    ["Joy saha is good", true],
    ["Joy saha is good", true],
  ];

  void onchangechecktounchenck(int index) {
    toto[index][1] = !toto[index][1];
    setState(() {});
  }

  void addto() {
    toto.add([_controller.text.toString(), false]);
    setState(() {});
  }

  void deletedto4(int index) {
    toto.removeAt([index][0]);
    setState(() {});
  }

  void addtofunction() {
    if (_key.currentState!.validate()) {
      return addto();
    }
  }

  bottomclickstep() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Form(
                    key: _key,
                    child: Container(
                      height: 120,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                          left: 15,
                          right: 15,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter Note?";
                            }
                            return null;
                          },
                          controller: _controller,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          addtofunction();
                          _controller.clear();
                        },
                        child: Container(
                          height: 50,
                          width: 80,
                          child: Center(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50,
                          width: 80,
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 231, 221, 132).withOpacity(0.9),
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.yellow,
        onPressed: () {
          bottomclickstep();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            "Todo Application",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: toto.length,
          itemBuilder: (context, index) {
            return conti222(
              value: toto[index][1],
              onChanged: (x) {
                onchangechecktounchenck(index);
              },
              title: toto[index][0],
              deletedto: () {
                deletedto4(index);
              },
            );
          }),
    );
  }
}
