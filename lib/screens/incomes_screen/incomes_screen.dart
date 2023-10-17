import 'package:cards_calculator/custom_theme.dart';
import 'package:cards_calculator/data/incomes_change_notifier.dart';
import 'package:cards_calculator/data/models/income.dart';
import 'package:cards_calculator/routes.dart';
import 'package:cards_calculator/screens/incomes_screen/widgets/income_options_bottom_sheet.dart';
import 'package:cards_calculator/screens/incomes_screen/widgets/widgets.dart';
import 'package:cards_calculator/utils/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class IncomesScreen extends StatefulWidget {
  const IncomesScreen({super.key});

  @override
  State<IncomesScreen> createState() => _IncomesScreenState();
}

class _IncomesScreenState extends State<IncomesScreen> {
  late final IncomesChangeNotifier _incomesChangeNotifier;
  @override
  void initState() {
    super.initState();
    _incomesChangeNotifier = context.read<IncomesChangeNotifier>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListenableBuilder(
        listenable: _incomesChangeNotifier,
        builder: (context, child) {
          return ScrollConfiguration(
            behavior:
                const MaterialScrollBehavior().copyWith(overscroll: false),
            child: CustomScrollView(
              slivers: _incomesChangeNotifier.incomes.isEmpty
                  ? [
                      SliverFillRemaining(
                        child: IncomesEmptyBody(
                          onAddIncomeTap: _onAddIncomeTap,
                        ),
                      ),
                    ]
                  : [
                      SliverAppBar(
                        backgroundColor: context.theme.scaffoldBackgroundColor,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ДОХОДЫ',
                              style: context.textTheme.displayLarge,
                            ),
                            InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: _onAddIncomeTap,
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  'Добавить доход',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: CustomTheme.greyColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        pinned: true,
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverList.builder(
                          itemBuilder: (context, index) {
                            final income =
                                _incomesChangeNotifier.incomes[index];

                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '\$${income.amount.toString()}',
                                            style: context.textTheme.labelSmall
                                                ?.copyWith(
                                                    color:
                                                        CustomTheme.blackColor),
                                          ),
                                          if (income
                                              .description.isNotEmpty) ...[
                                            const SizedBox(height: 4),
                                            Text(
                                              income.description,
                                              style:
                                                  context.textTheme.titleSmall,
                                            ),
                                          ]
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => _onIncomeOptionsTap(index),
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child:
                                          SvgPicture.asset('assets/more.svg'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                const Divider(
                                  color: CustomTheme.fontGreyColor,
                                ),
                              ],
                            );
                          },
                          itemCount: _incomesChangeNotifier.incomes.length,
                        ),
                      ),
                    ],
            ),
          );
        },
      ),
    );
  }

  void _onAddIncomeTap() async {
    final newIncome = await context.pushNamed<Income?>(Routes.addIncome);
    if (newIncome == null) return;
    _incomesChangeNotifier.addIncome(newIncome);
  }

  void _onIncomeOptionsTap(int incomeIndex) {
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      builder: (context) => IncomeOptionsBottomSheet(
        incomeIndex: incomeIndex,
        incomesChangeNotifier: _incomesChangeNotifier,
        onEditTap: () => _onEditTap(incomeIndex),
        onDeleteTap: () => _onDeleteTap(incomeIndex),
        onCancelTap: () => context.pop(),
      ),
    );
  }

  void _onEditTap(int incomeIndex) async {
    context.pop();
    final edittedIncome = await context.pushNamed<Income?>(
      Routes.addIncome,
      extra: _incomesChangeNotifier.incomes[incomeIndex],
    );
    if (edittedIncome == null) return;

    _incomesChangeNotifier.editIncome(incomeIndex, edittedIncome);
  }

  void _onDeleteTap(int incomeIndex) {
    _incomesChangeNotifier.removeIncome(incomeIndex);
    context.pop();
  }
}
