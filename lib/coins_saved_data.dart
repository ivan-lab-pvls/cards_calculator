import 'package:cards_calculator/coins_screen.dart';
import 'package:flutter/material.dart';

class CoinsPageShow extends StatefulWidget {
  const CoinsPageShow({Key? key}) : super(key: key);

  @override
  State<CoinsPageShow> createState() => _CoinsPageShowState();
}

class _CoinsPageShowState extends State<CoinsPageShow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 20,
          ),
          GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: 12,
            itemBuilder: (context, index) {
              return CoinsCardBuilder(index: index);
            },
          ),
          const SizedBox(
            height: 125,
          ),
        ],
      ),
    );
  }
}
