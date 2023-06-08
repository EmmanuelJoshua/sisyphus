import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sisyphus/core/core.dart';
import 'package:sisyphus/features/home/presentation/widgets/timeframe_selector.dart';

import 'package:sisyphus/shared/utils/utils.dart';
import 'package:sisyphus/shared/widgets/widgets.dart';

class Charts extends HookConsumerWidget {
  const Charts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTradingView = useState(true);
    return Column(
      children: [
        const Gap(7),
        TimeframeSelector(
          onSelected: (value) {},
        ),
        const Gap(15),
        Divider(
          color: blackTint.withOpacity(.1),
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 9,
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  if (!isTradingView.value) {
                    isTradingView.value = true;
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 13,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: isTradingView.value
                        ? context.isDarkMode()
                            ? const Color(0xff555C63)
                            : const Color(0xffCFD3D8)
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: SubText(
                      text: 'Trading view',
                      textSize: 14,
                      foreground: context.isDarkMode()
                          ? blackTint
                          : rockBlack.withOpacity(.8),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (isTradingView.value) {
                    isTradingView.value = false;
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 13,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: !isTradingView.value
                        ? context.isDarkMode()
                            ? const Color(0xff555C63)
                            : const Color(0xffCFD3D8)
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: SubText(
                      text: 'Depth',
                      textSize: 14,
                      foreground: context.isDarkMode()
                          ? blackTint
                          : rockBlack.withOpacity(.8),
                    ),
                  ),
                ),
              ),
              const Gap(5),
              SvgPicture.asset(
                ImageAssets.expand,
              )
            ],
          ),
        ),
        Divider(
          color: blackTint.withOpacity(.1),
          thickness: 1,
        ),
      ],
    );
  }
}
