import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'coins_data_for_api.dart';
import 'utils/cur.dart';
import 'utils/list_coins_selected.dart';

// ignore: must_be_immutable
class CoinsCardBuilder extends StatelessWidget {
  CoinsCardBuilder({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 225, 225, 225),
          border: Border.all(
            width: 1,
            color: const Color(0xFFECECEC),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: CupertinoButton(
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => CoinsDetailsPage(
                  CoinsSetNameAppBar: CurrenciesDataValue.values[index],
                ),
              ),
            );
          },
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: ColoredBox(
                          color: Colors.grey,
                          child: SvgPicture.network(
                            "https://s3-symbol-logo.tradingview.com/country/${CurrenciesDataValue.values[index].name[0]}${CurrenciesDataValue.values[index].name[1]}.svg",
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: ColoredBox(
                          color: Colors.grey,
                          child: SvgPicture.network(
                            "https://s3-symbol-logo.tradingview.com/country/${CurrenciesDataValue.values[index].name[3]}${CurrenciesDataValue.values[index].name[4]}.svg",
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  CurrenciesDataValue.values[index].name,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
