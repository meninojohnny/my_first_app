import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String) setValue1;
  final Function(String) setValue2;
  final String hintText;
  final void Function()? onPressed;
  final String label;

  CustomTextField({
    Key? key,
    required this.onPressed,
    required this.setValue1,
    required this.setValue2,
    required this.label,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 150, 199, 1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(135, 0, 0, 0),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(-1, 1),
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 150,
                height: 40,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 234, 227, 227),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 2, color: Colors.black)),
                child: TextField(
                  onChanged: setValue1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nome',
                  ),
                ),
              ),

              //SizedBox(width: 10),
              Container(
                width: 100,
                height: 40,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 234, 227, 227),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: TextField(
                  onChanged: setValue2,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                  ),
                ),
              ),

              //SizedBox(width: 10),
              GestureDetector(
                onTap: onPressed,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 8, 228, 16),
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.black)),
                  child: Icon(Icons.add, color: Colors.black),
                ),
              ),
            ],
          ), // Row;
        ],
      ),
    );
  }
}
