import 'package:ecommerce/controllers/favourite_cotroller.dart';
import 'package:ecommerce/second/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
   ItemDetails({super.key,
    required this.image,
     required this.id,
    required this.discription,
    required this.discriptoin_ar,
    required this.name_ar,
    required this.name,
    required this.count,
    required this.active,
    required this.price,
    required this.discount,
    // required this.ontap
  });
  String image;
  String id;
  String discription;
  String discriptoin_ar;
  String name_ar;
  String count;
  String active;
  String price;
  String name;
  String discount;
  // final Function ontap;
  @override
  var controller =Get.find<FavouriteControllerIMP>();
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(children: [
        Image.network("$linkfile/$image"),
        Text(name),
        Text(discription),
        Text("the diccount is : $discount"),
        Text("the price before the discount is: $price\$"),
        Text("${((1-(int.parse(discount))/100)*double.parse(price)).remainder(3)}\$"),
        Text("there is still :$count"),
        GetBuilder<FavouriteControllerIMP>(
            init: controller,
            builder: (context)=>FutureBuilder(

                future: controller.check(id), builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return  const Center(
                  child: CircularProgressIndicator(),
                );
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

              return Icon(Icons.add);
            }
            )
        )
      ],) ,
    );
  }
}
