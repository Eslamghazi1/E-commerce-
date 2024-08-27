import 'package:ecommerce/controllers/request.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/second/item_details.dart';
import 'package:ecommerce/second/linkapi.dart';
import 'package:ecommerce/second/view_category.dart';
import 'package:ecommerce/view/view_item.dart';
import 'package:ecommerce/view/view_note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    request instance=request();
    List categories=[];
    List categoriesid=[];
    return SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child:
                    IconButton(onPressed: (){
                      showSearch(context: context, delegate: datasearch(search: search.text));

                    },icon: Icon(Icons.search),)
                  // TextField(
                  //   controller: search,
                  //   onTap: (){
                  //     // showSearch(context: context, delegate: datasearch(search: search.text).buildResults(context));
                  //     showSearch(context: context, delegate: datasearch(search: search.text));
                  //   },
                  //   onSubmitted: (value){
                  //     // showSearch(context: context, delegate: datasearch(search: value).buildResults(context));
                  //   },
                  //   decoration: const InputDecoration(
                  //     suffixIcon: Icon(Icons.search),
                  //     label: Text("Search"),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(20)),
                  //       borderSide:
                  //       BorderSide(color: Colors.blue, width: 2.0),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(20)),
                  //       borderSide:
                  //       BorderSide(color: Colors.grey, width: 1.0),
                  //     ),
                  //     errorBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(20)),
                  //       borderSide:
                  //       BorderSide(color: Colors.red, width: 2.0),
                  //     ),
                  //     // hintText: 'Enter Email',
                  //   ),
                  //   showCursor: true,
                  // ),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(onPressed: (){

                    }, icon: Icon(Icons.notifications))),
              ],
            ),
            Text("Categories and the user id is :${prefss.getInt("id")}",style: TextStyle(fontSize: 20),),
            Container(
              height: 300,
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!["data"] != null) {
                    return ListView.builder(
                        itemBuilder: (context, index) {
                    categories.add(snapshot.data!["data"][index]["name"].toString());
                    categoriesid.add(snapshot.data!["data"][index]["id"]);
                          return Container(
                            width: 100,
                            height: 100,
                            child: ViewNote(image: snapshot.data!["data"][index]["image"],
                              title: snapshot.data!["data"][index]["name"].toString(),
                              // content: snapshot.data!["data"][index]["note_content"]
                              //     .toString(),
                              ontap: () {
                              print(categories);
                              Get.to(()=>ViewCategory(item_cat:snapshot.data!["data"][index]["id"],
                                  categories:categories,categoriesid:categoriesid));

                              },
                            ),
                          );
                        },
                        itemCount:
                        snapshot.data!["data"].length
                    );
                  } else {
                    return const Center(
                      child: Text("Nothing yet!!"),
                    );
                  }
                },
                future: instance.postrequest(
                    category, {}),
              ),
            ),
            Text("Highest dicount items",style: TextStyle(fontSize: 20),),
            Container(
              height: 400,
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return  const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!["data"]!=null) {
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100,
                            height: 100,
                            child: ViewItem(
                              id: snapshot.data!["data"][index]["id"].toString(),
                              active: snapshot.data!["data"][index]["active"].toString(),
                              count: snapshot.data!["data"][index]["count"].toString(),
                              discount:snapshot.data!["data"][index]["discount"].toString(),
                              discription: snapshot.data!["data"][index]["discription"],
                              discriptoin_ar:snapshot.data!["data"][index]["discriptoin_ar"],
                              name_ar:snapshot.data!["data"][index]["name_ar"],
                              price:snapshot.data!["data"][index]["price"].toString(),

                              image: snapshot.data!["data"][index]["image"],
                              name: snapshot.data!["data"][index]["name"],
                              // content: snapshot.data!["data"][index]["note_content"]
                              //     .toString(),
                              ontap: () {
                                        Get.to(()=>
                                            ItemDetails(
                                              id: snapshot.data!["data"][index]["id"].toString(),
                                              active: snapshot.data!["data"][index]["active"].toString(),
                                              count: snapshot.data!["data"][index]["count"].toString(),
                                              discount:snapshot.data!["data"][index]["discount"].toString(),
                                              discription: snapshot.data!["data"][index]["discription"],
                                              discriptoin_ar:snapshot.data!["data"][index]["discriptoin_ar"],

                                              name_ar:snapshot.data!["data"][index]["name_ar"],
                                              price:snapshot.data!["data"][index]["price"].toString(),

                                              image: snapshot.data!["data"][index]["image"],
                                              name: snapshot.data!["data"][index]["name"],
                                              // content: snapshot.data!["data"][index]["note_content"]
                                              //     .toString(),

                                            ),);
                              },
                            ),
                          );
                        },
                        itemCount:
                        snapshot.data!["data"].length
                    );
                  } else {
                    return const Center(
                      child: Text("Nothing yet!!"),
                    );
                  }
                },
                future: instance.postrequest(
                    categorydis, {"discount":"-1"}),
              //   "discount":"1"
              ),
            )
          ],
        ),
      );
  }
}


class datasearch extends SearchDelegate{
datasearch({required this.search});
String search;
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[ IconButton(icon: Icon(Icons.close),onPressed: (){
      query="";

    },)];
  }

  @override
  Widget? buildLeading(BuildContext context) {

    // TODO: implement buildLeading
    return IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
      FocusScope.of(context).unfocus();
      close(context, context);
      },);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    search=query;
    request instance=request();
    return  Container(
      height: 400,
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  const Center(
              child: CircularProgressIndicator(),
            );
          }print("++++++==========+++++++++++");
          print("the data is ${snapshot.data}");
          if (snapshot.data!=null &&snapshot.data!["status"]!="Fail") {
            if(query.isEmpty) {
              return Center(child: const Text("No Data !!!!"));
            };
            return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    height: 100,
                    child: ViewItem(
                      id: snapshot.data!["data"][index]["id"].toString(),
                      active: snapshot.data!["data"][index]["active"].toString(),
                      count: snapshot.data!["data"][index]["count"].toString(),
                      discount:snapshot.data!["data"][index]["discount"].toString(),
                      discription: snapshot.data!["data"][index]["discription"],
                      discriptoin_ar:snapshot.data!["data"][index]["discriptoin_ar"],
                      name_ar:snapshot.data!["data"][index]["name_ar"],
                      price:snapshot.data!["data"][index]["price"].toString(),

                      image: snapshot.data!["data"][index]["image"],
                      name: snapshot.data!["data"][index]["name"],
                      // content: snapshot.data!["data"][index]["note_content"]
                      //     .toString(),
                      ontap: () {
                        Get.to(()=>
                            ItemDetails(
                              id: snapshot.data!["data"][index]["id"].toString(),
                              active: snapshot.data!["data"][index]["active"].toString(),
                              count: snapshot.data!["data"][index]["count"].toString(),
                              discount:snapshot.data!["data"][index]["discount"].toString(),
                              discription: snapshot.data!["data"][index]["discription"],
                              discriptoin_ar:snapshot.data!["data"][index]["discriptoin_ar"],

                              name_ar:snapshot.data!["data"][index]["name_ar"],
                              price:snapshot.data!["data"][index]["price"].toString(),

                              image: snapshot.data!["data"][index]["image"],
                              name: snapshot.data!["data"][index]["name"],
                              // content: snapshot.data!["data"][index]["note_content"]
                              //     .toString(),

                            ),);
                      },
                    ),
                  );
                },
                itemCount: snapshot.data!["data"].length
            );
          } else {
            return const Center(
              child: Text("Nothing !!"),
            );
          }
        },
        future: instance.postrequest(
            searchlink, {"name":search
            }),
        //   "discount":"1"
      ),
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    search=query;
    return  ListView.builder(
      itemCount: 5,
      itemBuilder: (context,i){
        return InkWell(
        onTap: (){
        },
        child: Container(
          // padding: EdgeInsets.all(10),
          // child:Text("suggestions")
          ) ,

      );},);
  }

}

