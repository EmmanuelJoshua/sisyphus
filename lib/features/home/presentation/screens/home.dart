import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sisyphus/core/core.dart';
import 'package:sisyphus/features/home/presentation/widgets/charts.dart';
import 'package:sisyphus/features/home/presentation/widgets/orderbook.dart';
import 'package:sisyphus/features/home/presentation/widgets/trades.dart';
import 'package:sisyphus/shared/utils/utils.dart';
import 'package:sisyphus/shared/widgets/widgets.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(
      initialLength: 3,
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).shadowColor,
                width: 1.5,
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: false,
            title: SvgPicture.asset(
              ImageAssets.logo,
              colorFilter: ColorFilter.mode(
                context.isDarkMode() ? white : black,
                BlendMode.colorBurn,
              ),
            ),
            actions: [
              DefaultImageButton(
                image: ImageAssets.user,
                onPressed: () {},
              ),
              const Gap(15),
              DefaultImageButton(
                size: 24,
                image: ImageAssets.globe,
                isSvg: true,
                onPressed: () {},
              ),
              const Gap(15),
              DefaultImageButton(
                image: ImageAssets.menu,
                isSvg: true,
                onPressed: () {},
              ),
              const Gap(14),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          const Gap(8),
          Container(
            height: 130,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border.all(
                color: Theme.of(context).shadowColor,
                width: 1.5,
              ),
            ),
            child: Column(
              children: [
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        ImageAssets.btcusd,
                        width: 44,
                        height: 24,
                      ),
                      const Gap(8),
                      const SubText(
                        text: 'BTC/USDT',
                        textSize: 18,
                      ),
                      const Gap(18),
                      InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(2),
                          child: Icon(Icons.keyboard_arrow_down_rounded),
                        ),
                      ),
                      const Gap(27),
                      const SubText(
                        text: r'$20,634',
                        textSize: 18,
                        foreground: textGreen,
                      ),
                    ],
                  ),
                ),
                const Gap(18),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  size: 18,
                                  color: blackTint,
                                ),
                                Gap(5),
                                SubText(
                                  text: '24h change',
                                  textSize: 12,
                                  foreground: blackTint,
                                )
                              ],
                            ),
                            Gap(5),
                            SubText(
                              text: '520.80 +1.25%',
                              textSize: 14,
                              foreground: textGreen,
                            )
                          ],
                        ),
                        const Gap(17),
                        Container(
                          width: 1,
                          height: 48,
                          color: divider.withOpacity(.08),
                        ),
                        const Gap(17),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_upward_rounded,
                                  size: 18,
                                  color: blackTint,
                                ),
                                Gap(5),
                                SubText(
                                  text: '24h high',
                                  textSize: 12,
                                  foreground: blackTint,
                                )
                              ],
                            ),
                            Gap(5),
                            SubText(
                              text: '520.80 +1.25%',
                              textSize: 14,
                            )
                          ],
                        ),
                        const Gap(17),
                        Container(
                          width: 1,
                          height: 48,
                          color: divider.withOpacity(.08),
                        ),
                        const Gap(17),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_upward_rounded,
                                  size: 18,
                                  color: blackTint,
                                ),
                                Gap(5),
                                SubText(
                                  text: '24h high',
                                  textSize: 12,
                                  foreground: blackTint,
                                )
                              ],
                            ),
                            Gap(5),
                            SubText(
                              text: '520.80 +1.25%',
                              textSize: 14,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(8),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border.all(
                color: Theme.of(context).shadowColor,
                width: 1.5,
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 42,
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).shadowColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).shadowColor,
                      width: 1.5,
                    ),
                  ),
                  child: TabBar(
                    controller: tabController,
                    padding: const EdgeInsets.all(2),
                    labelStyle: const TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    tabs: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Charts'),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Orderbook'),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Recent trades'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      const Charts(),
                      const Orderbook(),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.all(20),
                        child: const HeaderText(
                          text: 'Recent Trades',
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Gap(9),
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border.all(
                color: Theme.of(context).shadowColor,
                width: 1.5,
              ),
            ),
            child: const Trades(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DefaultButton(
                    title: 'Buy',
                    onPressed: () {},
                    color: const Color(0xff25C26E),
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: DefaultButton(
                    title: 'Sell',
                    onPressed: () {},
                    color: const Color(0xffFF554A),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
