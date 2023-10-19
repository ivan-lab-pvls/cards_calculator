import 'package:cards_calculator/coins_data_for_api.dart';
import 'package:cards_calculator/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as bottomSheet;

class CoinsDataPage extends StatefulWidget {
  const CoinsDataPage({Key? key}) : super(key: key);

  @override
  State<CoinsDataPage> createState() => _CoinsDataPageState();
}

class _CoinsDataPageState extends State<CoinsDataPage> {
  final WebViewController _webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'КУРСЫ',
                  style: context.textTheme.displayLarge,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height * .73,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 30.0,
                    childAspectRatio: 3),
                itemCount: CurrenciesDataValue.values.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      bottomSheet.showCupertinoModalBottomSheet(
                        context: context,
                        enableDrag: false,
                        builder: (context) {
                          _webViewController.loadHtmlString("""
                                        <!-- TradingView Widget BEGIN -->
                                        <div class="tradingview-widget-container">
                                          <div id="tradingview_8aa14"></div>
                                          <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Track all markets on TradingView</span></a></div>
                                          <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
                                          <script type="text/javascript">
                                          new TradingView.widget(
                                          {
                                          "autosize": true,
                                          "symbol": "OANDA:${CurrenciesDataValue.values[index].name}",
                                          "interval": "D",
                                          "timezone": "Etc/UTC",
                                          "theme": "light",
                                          "style": "1",
                                          "locale": "en",
                                          "toolbar_bg": "#f1f3f6",
                                          "enable_publishing": false,
                                          "allow_symbol_change": true,
                                          "container_id": "tradingview_8aa14"
                                        }
                                          );
                                          </script>
                                        </div>
                                        <!-- TradingView Widget END -->
                                        """);
                          return Scaffold(
                            appBar: AppBar(
                              backgroundColor: Theme.of(context).primaryColor,
                              elevation: 0,
                              title: Text(
                                CurrenciesDataValue.values[index].name,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.dmSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).canvasColor,
                                ),
                              ),
                              automaticallyImplyLeading: false,
                              leading: CupertinoButton(
                                child: Icon(
                                  Icons.close,
                                  color: Theme.of(context).canvasColor,
                                  size: 24,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            body: WebViewWidget(controller: _webViewController),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 20,
                      width: 200,
                      padding: EdgeInsets.zero,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 231, 231, 232),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 35,
                              height: 20,
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      height: 23,
                                      width: 23,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.network(
                                          "https://s3-symbol-logo.tradingview.com/country/${CurrenciesDataValue.values[index].name[3]}${CurrenciesDataValue.values[index].name[4]}.svg"),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    child: Container(
                                      height: 21,
                                      width: 21,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.network(
                                          "https://s3-symbol-logo.tradingview.com/country/${CurrenciesDataValue.values[index].name[0]}${CurrenciesDataValue.values[index].name[1]}.svg"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              CurrenciesDataValue.values[index].name,
                              textAlign: TextAlign.center,
                              style: context.textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
