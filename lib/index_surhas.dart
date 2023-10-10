import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:train/models/chapters.dart';

class IndexSurhas extends StatefulWidget {
  const IndexSurhas({super.key});

  @override
  State<IndexSurhas> createState() => _IndexSurhasState();
}

Future<ChaptersListModel> getCharacters() async {
  try {
    var response = await get(
        Uri.parse("https://api.quran.com/api/v4/chapters?language=ar"));
    return ChaptersListModel.fromJson(jsonDecode(response.body));
  } on HttpException catch (_) {
    return ChaptersListModel();
  }
}

class _IndexSurhasState extends State<IndexSurhas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getCharacters(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.chapters != null
                    ? ListView.builder(
                        itemCount: snapshot.data!.chapters!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            margin: EdgeInsets.zero,
                            shape: const Border(
                                bottom:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.only(right: 0, left: 15),
                              leading: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 0.5, color: Colors.white))),
                                width: 30,
                                child: Center(
                                  child: Text(
                                    "${index + 1}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              title: Text(
                                  "${snapshot.data!.chapters![index].nameArabic}"),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("آياتها"),
                                  Text(
                                      "${snapshot.data!.chapters![index].versesCount}")
                                ],
                              ),
                            ),
                          );
                        })
                    : const Center(
                        child: Text("هناك خطأ في تحميل البيانات"),
                      );
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
