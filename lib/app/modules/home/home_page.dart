// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meme_hub/app/core/ui/atons/typography/custom_text.dart';
import 'package:meme_hub/app/core/ui/atons/typography/typography.dart';
import 'package:meme_hub/app/core/ui/extensions/size_extensions.dart';
import 'package:meme_hub/app/core/ui/styles/colors_app.dart';
import 'package:meme_hub/app/modules/home/widgets/post_widget.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
    store.initClass();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: context.percentWidth(0.3),
                child: SvgPicture.asset(
                  'assets/svg/logo.svg',
                ),
              ),
            ),
            Container(
              color: borderGrey,
              height: 1,
              width: context.screenWidth,
            ),
            const CustomText(
              textType: TypographyType.baseMedium,
              text: 'For you',
              color: fontColor,
            ),
            const SizedBox(
              height: 4,
            ),
            Expanded(
              child: Observer(
                builder: (context) {
                  return ListView.separated(
                    itemCount: store.posts.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                    itemBuilder: (context, index) {
                      final isLastIndex = index == store.posts.length - 1;
                      final post = store.posts[index];
                      return Column(
                        children: [
                          PostCard(
                            post: post,
                          ),
                          if (isLastIndex)
                            const SizedBox(
                              height: 48,
                            )
                        ],
                      );
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
