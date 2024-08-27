import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

// String _basicAuth = 'Basic ' +
//     base64Encode(utf8.encode(
//         'eslamghazi:ghazi012'));
//
// Map<String, String> myheaders = {
//   'authorization': _basicAuth
// };

class request{
  getrequest(String url)async{
    try{
      var response=await http.get((Uri.parse(url)),);
      if(response.statusCode==200){
        var responsebody=jsonDecode(response.body).toString();
        return responsebody;
      }else
        {
          print("error :${response.statusCode}");
        }
    }catch(e){
      print("something is wrong error :$e");
    }
  }
Future<Map<String,dynamic>?> postrequest(String url,Map data,)async{
    try{
    var response=await http.post(Uri.parse(url),body: data
        // ,headers: myheaders
    );
      if(response.statusCode==200){
        Map<String,dynamic> instance=jsonDecode(response.body);
        return instance;
      }else
      {
        print("error :${response.statusCode}");
      }
    }catch(e){
      print("something is wrong error :$e");
    }
  }
  postfile(String url,Map data,File file)async{
    var request=http.MultipartRequest("POST",Uri.parse(url));
    var length=await file.length();
    var stream=http.ByteStream(file.openRead());
    var partfile=http.MultipartFile("file",stream,length,
    filename: basename(file.path));
    // request.headers.addAll(myheaders);
    request.files.add(partfile);
    data.forEach((key,value){
      request.fields[key]=value;
    });
    var myrequest=await request.send();
    var response=await http.Response.fromStream(myrequest);
    if(myrequest.statusCode==200){
      print("the respone in the postfile is :${response.body}");
      return jsonDecode(response.body);
    }else {
      print("Error in the file post is ${myrequest.statusCode}");
    }
  }
}