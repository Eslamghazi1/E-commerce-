import 'package:ecommerce/controllers/favourite_cotroller.dart';
import 'package:ecommerce/data/services.dart';
import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../second/linkapi.dart';

// Full texts
// id
// name Descending 1
// discription
// discriptoin_ar
// name_ar
// image
// count
// active
// price
// discount
// date
// item_cat
class ViewItem extends StatelessWidget {
  ViewItem({super.key,
    required this.image,
    required this.discription,
    required this.discriptoin_ar,
    required this.name_ar,
    required this.name,
    required this.count,
    required this.active,
    required this.price,
    required this.discount,
    required this.id,
    required this.ontap
  });
  String image;
  String discription;
  String discriptoin_ar;
  String name_ar;
  String count;
  String id;
  String active;
  String price;
  String name;
  String discount;
  // String item_cat;
// String content;
  final Function ontap;
// Image image;
  @override
  var controller =Get.find<FavouriteControllerIMP>();
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
              CircleAvatar(
                radius: MediaQuery.of(context).orientation == Orientation.landscape
                    ? 40 : 50,
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                foregroundImage:
                // image.isEmpty ? AssetImage("images/icon.png") :
                NetworkImage("$linkfile/$image"),

              ),
              Column(children: [
                Text(name),
                Text("the id is $id"),
                GetBuilder<FavouriteControllerIMP>(
                  init: controller,
                    builder: (context)=>FutureBuilder(

                        future: controller.check(id), builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                      }

                      if(snapshot.hasData){

                         return IconButton(onPressed: () async {
                        if (controller.favourite.isNotEmpty) {
                          await snapshot.data== true ?
                          controller.deletefavourite(id)
                              :
                          controller.addfavourite(id);
                        } else {
                          controller.addfavourite(id);
                        }
                      }, icon:
                      Icon(
                          color: Colors.red,
                          snapshot.data== true ?
                          Icons.favorite
                              :
                          Icons.favorite_border
                      ));
                      }

                        return Icon(Icons.favorite_border);
                    }
                    )
                        )
                // Text(content),
              ],),
            ],
          ),
        )),);
  }

}

