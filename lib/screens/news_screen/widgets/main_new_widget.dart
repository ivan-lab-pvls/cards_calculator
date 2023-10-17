import 'package:cards_calculator/constants.dart';
import 'package:cards_calculator/custom_theme.dart';
import 'package:cards_calculator/routes.dart';
import 'package:cards_calculator/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class MainNewWidget extends StatelessWidget {
  const MainNewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => context.pushNamed(
        Routes.newsDetailed,
        extra: Constants.mainNew,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              Constants.mainNew.imageUrl,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    Constants.mainNew.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: CustomTheme.blackColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  DateFormat('dd MMMM, yyyy')
                      .format(Constants.mainNew.dateTime),
                  style: context.textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
