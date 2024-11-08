import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todofirbase/Boldtext.dart';

// ignore: must_be_immutable
class conti222 extends StatelessWidget {
  conti222({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.deletedto,
  });

  bool value;
  void Function(bool?)? onChanged;
  String title;
  VoidCallback deletedto;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              deletedto();
            },
            child: Container(
              margin: EdgeInsets.only(right: 30),
              height: 70,
              width: 8,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 17, 0),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.delete,
                size: 25,
              ),
            ),
          ),
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            height: 70,
            width: 447,
            decoration: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Checkbox(value: value, onChanged: onChanged),
                Container(
                    child: Boldtext(
                  text: title,
                  check: value,
                )),
              ],
            )),
      ),
    );
  }
}
