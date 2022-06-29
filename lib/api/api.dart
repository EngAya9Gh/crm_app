import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  // headers: {
  // "Accept": "application/json",
  // "Access-Control-Allow-Origin": "*"}
  Future<dynamic> get({required String url}) async {
    // final client = RetryClient(http.Client());
    // try {
    //   print(await client.get(Uri.http('example.org', '')));
    // } finally {
    //   client.close();
    // }
    // http.Response response = await http.get(
    //   Uri.parse(url),
    // );
    //http.Response response = await RetryClient(http.Client()).get( Uri.parse(url));

    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Cache-Control": "no-cache"
      }
    );
    print(json.decode(response.body));
    if (json.decode(response.body)["code"] == "200") {
      print(jsonDecode(response.body)["message"]);
      return jsonDecode(response.body)["message"];
    } else {
      print("ex is ${json.decode(response.body)["code"] == "200"}");
      throw Exception(
          '${json.decode(response.body)["code"] == "200"}');
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic? body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    String result= response.body;
    print('before');
    print(result);
    int idx = result.indexOf("{");
    int length=result.length;
    result=result.substring(idx,length);//run for login and update client and set date task
    // // String result= response.body;
    // int idx = result.indexOf("{");
    // int idxEnd = result.indexOf("}");
    // int length=result.length;
    // result=result.substring(idx,idxEnd+1);//set approve is run but set don date not run

    print("resultttt");
    print(json.decode(result)["code"]);

    if (json.decode(result)["code"] == "200") {

      return jsonDecode(result)["message"];
    } else {

      throw Exception(
          '${json.decode(result)["message"]}');
    }

  }


  Future<dynamic> postRequestWithFile(
      String type,
      String url ,Map<String,dynamic> data,File? file,File? filelogo) async{
    var reguest=http.MultipartRequest("POST",  Uri.parse(url));
    if(file !=null){
      var length=await file.length();
      var stream=http.ByteStream(file.openRead());
      var multipartFile=http.MultipartFile(
          "file",stream,length,
          filename:basename(file.path)
      );
      reguest.files.add(multipartFile);
    }
    if(filelogo !=null){
      var length=await filelogo.length();
      var stream=http.ByteStream(filelogo.openRead());
      var multipartFile=http.MultipartFile(
          "filelogo",stream,length,
          filename:basename(filelogo.path)
      );
      reguest.files.add(multipartFile);
    }

    data.forEach((key, value) {
      reguest.fields[key]=value;
    });
    var myrequest=await reguest.send();
    var response=await http.Response.fromStream(myrequest);
    String result='';
    if(type=='array'){
      result= response.body;
       print('result');
       print(result);
      int idx = result.indexOf("{");
      int length=result.length;
      result=result.substring(idx,length);
    }
    else {
      result = response.body;
      print(result);
      int idx = result.indexOf("{");
      int idxEnd = result.indexOf("}");
      result = result.substring(
          idx, idxEnd + 1); //user update not run but run invoice
    } //

    print(result);
    if (json.decode(result)["code"] == "200") {

      return jsonDecode(result)["message"];
    } else {

      throw Exception(
          '${json.decode(result)["message"]}');
    }
  }
  Future<dynamic> delete({

    required String url,
    @required dynamic? body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

   // var response = await Dio().delete(
   //      url,queryParameters: {'fk_product':1,},
    http.Response response = await http.delete(
      Uri.parse(url),
     //   headers:   {
     //    "Accept": "application/json",
     //    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
     //
     // "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS
     //   'Content-Type': 'application/json; charset=UTF-8',
     //  //  "Access-Control-Allow-Headers":
     //  // "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
     // // "Access-Control-Allow-Methods": "*"
     // },
    );

    String result= response.body;
    int idx = result.indexOf("{");
    int length=result.length;
    result=result.substring(idx,length);
    print(result);
    print(json.decode(result)["code"]);
    //if (json.decode(result)["code"] == "200") {
      /*String data="";
      if(jsonDecode(result)["message"]=="done")
        data =jsonDecode(result)["message"] ;
      else
        Map<String, dynamic>  jsonDecode(result)["message"];*/
      //print("in json data is $data");
    //   return jsonDecode(result)["message"];
    // } else {
    //
    //   throw Exception(
    //       '${json.decode(result)["message"]}');
    // }
    return jsonDecode(result)["message"];

  }
}