import 'package:flutter/material.dart';
import 'package:ecommerce/data/color.dart';

class Custombuttonlanguage extends StatelessWidget {
   Custombuttonlanguage({super.key,required this.name,this.onPressed});
 String name="";
 void Function()?onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed:onPressed,
        child: Text(
          name,
          style:const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
