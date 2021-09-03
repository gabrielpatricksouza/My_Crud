import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomChangeChoice extends StatefulWidget {

  final Function function;
  final int valueSex;

  CustomChangeChoice({required this.function, required this.valueSex});

  @override
  _CustomChangeChoiceState createState() => _CustomChangeChoiceState();
}

class _CustomChangeChoiceState extends State<CustomChangeChoice> {

  @override
  Widget build(BuildContext context) {
    return  Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 2.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  widget.function(0);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: widget.valueSex == 0 ? Colors.indigoAccent : Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25)
                      )
                  ),
                  height: 60,
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.mars,
                        color: widget.valueSex == 0
                            ? Colors.white
                            : Colors.black
                      ),
                      SizedBox(width: 10,),

                      Text("Homem",
                        style: TextStyle(
                          fontSize: 18,
                          color: widget.valueSex == 0
                              ? Colors.white
                              : Colors.black
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              child: GestureDetector(
                onTap: () {
                   widget.function(1);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: widget.valueSex == 1 ? Colors.purpleAccent : Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25)
                      )
                  ),
                  height: 60,
                  width: 100,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                          FontAwesomeIcons.venus,
                          color: widget.valueSex == 1
                              ? Colors.white
                              : Colors.black
                      ),
                      SizedBox(width: 10,),

                      Text("Mulher",
                        style: TextStyle(
                          fontSize: 18,
                          color: widget.valueSex == 1
                              ? Colors.white
                              : Colors.black
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
