import 'package:flutter/material.dart';

class DialogFb1 extends StatelessWidget {
  const DialogFb1({Key? key}) : super(key: key);


  
  @override
  Widget build(BuildContext context) {
      final primaryColor = Theme.of(context).colorScheme.primary;
  
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(

             
              radius: 25,
              child: Icon(Icons.check,color: primaryColor,size: 45,),
              
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("Added!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 3.5,
            ),
            const Text("Product Added to Cart",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w300)),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               SimpleBtn1(text: "Great", onPressed: () {
                Navigator.of(context).pop();
               },primaryColor: primaryColor,accentColor: Colors.white,),
            //  SimpleBtn1(
            //       text: "Not bad",
            //       onPressed: () {
            //       },
            //       primaryColor: primaryColor,
            //       accentColor: Colors.white,
            //       invertedColors: true,
            //     ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SimpleBtn1 extends StatelessWidget {
  final Color primaryColor;
  final String text;
  final Function() onPressed;
  final bool invertedColors;
  final Color accentColor;
  SimpleBtn1(
      {required this.text,
      required this.primaryColor,
      required this.onPressed,
      this.invertedColors = false,
      required this.accentColor,
      Key? key})
      : super(key: key);
 


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            alignment: Alignment.center,
            side: MaterialStateProperty.all(
                BorderSide(width: 1, color: primaryColor)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(right: 25, left: 25, top: 0, bottom: 0)),
            backgroundColor: MaterialStateProperty.all(
                invertedColors ? accentColor : primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: invertedColors ? primaryColor : accentColor, fontSize: 16),
        ));
  }
}
