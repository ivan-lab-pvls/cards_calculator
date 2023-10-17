import 'dart:convert';
import 'package:cards_calculator/constants.dart';
import 'package:cards_calculator/screens/card_product/card_choosed.dart';
import 'package:cards_calculator/utils/extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String apiX = 'https://secondphone.org/landers/landings/GazpromTop1';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic>? dataofCards;
  String api = defaultData;
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      final contentType = response.headers['content-type'];
      if (contentType?.toLowerCase().contains('application/json') == true) {
        final jsonString = utf8.decode(response.bodyBytes);
        final jsonData = json.decode(jsonString);
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            dataofCards = jsonData;
          });
        });
      } else {}
    } else {}
  }

  Future<String> getData() async {
    try {
      Dio dio = Dio();
      dio.options.headers['apikey'] = authKey;
      dio.options.headers['Authorization'] = 'Bearer $authKey';
      http.Response response = await http.get(Uri.parse(linkData));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        String datas = data['json'];
        setState(() {
          api = datas;
        });
        return datas;
      } else {
        return defaultData;
      }
    } catch (error) {
      return defaultData;
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataofCards == null
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : dataofCards!.isEmpty
              ? const Center(
                  child: Text('Данные не найдены'),
                )
              : SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 35.0, top: 10, right: 35.0),
                    child: ListView(
                      children: [
                        Text(
                          "Главная",
                          textAlign: TextAlign.left,
                          style: context.textTheme.displayLarge,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Выберите интересующую категорию',
                          textAlign: TextAlign.center,
                          style: context.textTheme.displayLarge,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .7,
                          child: Center(
                            child: ListView.builder(
                              itemCount: dataofCards!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                final banksx = dataofCards![index];
                                final imageSet =
                                    banksx['icon'].toString().substring(1);
                                final image = '$apiX$imageSet';
                                return Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChoosedCard(
                                            itms: banksx['items'],
                                            api: api,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              height: 70,
                                              width: 70,
                                              child: Image.network(image)),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            banksx['title']!,
                                            maxLines: 2,
                                            style:
                                                context.textTheme.displayLarge,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
