import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../second/linkapi.dart';

class ViewNote extends StatelessWidget {
   ViewNote({super.key,required this.title,required this.image,required this.ontap});
String title;
String image;
// String content;
final Function ontap;
// Image image;
  @override
  Widget build(BuildContext context) {
    return Card(child: InkWell(
      onTap: (){
        ontap();
      },
        child: Container(
          width: 130,
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              image.contains("svg")?
              SvgPicture.network(
                color: Colors.deepOrange,
                "${linkfile}/$image",
                fit: BoxFit.fill,
                height: 80,
                alignment: Alignment.center,
                // color: Get.isDarkMode ? Colors.teal : Colors.blueGrey,
              ):
              // CircleAvatar(
              //   radius: MediaQuery.of(context).orientation == Orientation.landscape
              //       ? 40 : 50,
              //   backgroundColor: Theme.of(context).secondaryHeaderColor,
              //   foregroundImage:
              //   // image.isEmpty ? AssetImage("images/icon.png") :
              //   NetworkImage("$linkimage/$image"),
              //
              // ),
              Column(children: [
                    Text(title),
                    // Text(content),
                  ],),
            ],
          ),
        )),);
  }
}
