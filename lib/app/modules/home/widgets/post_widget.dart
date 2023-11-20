import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:meme_hub/app/core/ui/atons/typography/custom_text.dart';
import 'package:meme_hub/app/core/ui/atons/typography/typography.dart';
import 'package:meme_hub/app/core/ui/extensions/size_extensions.dart';
import 'package:meme_hub/app/core/ui/styles/colors_app.dart';
import 'package:meme_hub/app/models/post/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderGrey),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1.5,
            blurRadius: 2,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                const Icon(Icons.account_circle_rounded),
                const SizedBox(width: 4),
                CustomText(
                  textType: TypographyType.smRegular,
                  text: post.ownerUsername,
                  color: fontColor,
                ),
                const Spacer(),
                CustomText(
                  textType: TypographyType.xsRegular,
                  text: post.differenceTimePost,
                  color: fontColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: CustomText(
              textType: TypographyType.baseBold,
              text: post.title,
              color: fontColorbold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(10),
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: Image.network(
                post.imageUrl,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return SizedBox(
                    height: 280,
                    child: Center(
                      child: LoadingAnimationWidget.discreteCircle(
                        color: primary,
                        secondRingColor: primarylight,
                        thirdRingColor: primaryBold,
                        size: 60,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/thumb_up.svg',
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      CustomText(
                        textType: TypographyType.smRegular,
                        text: "${post.ratingLike} gostaram",
                        color: fontColor,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                SizedBox(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/thumb_down.svg',
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      CustomText(
                        textType: TypographyType.smRegular,
                        text: '${post.ratingDislike} não gostaram',
                        color: fontColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (post.commentCount > 0) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                ),
                onPressed: () {},
                child: CustomText(
                  textType: TypographyType.smRegular,
                  text: 'Ver todos os ${post.commentCount} comentários',
                  color: primary,
                ),
              ),
            ),
          ] else
            const SizedBox(
              height: 16,
            )
        ],
      ),
    );
  }
}
