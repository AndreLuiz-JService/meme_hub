// ignore_for_file: prefer_const_constructors

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:meme_hub/app/core/global/enum/enums.dart';
import 'package:meme_hub/app/core/ui/atons/typography/custom_text.dart';
import 'package:meme_hub/app/core/ui/atons/typography/typography.dart';
import 'package:meme_hub/app/core/ui/extensions/size_extensions.dart';
import 'package:meme_hub/app/core/ui/mixin/messages.dart';
import 'package:meme_hub/app/core/ui/styles/colors_app.dart';
import 'package:meme_hub/app/modules/profile/profile_module.dart';
import 'package:meme_hub/app/modules/profile/profile_store.dart';
import 'package:flutter/material.dart';
import 'package:meme_hub/app/modules/profile/widgets/select_view_state.dart';
import 'package:mobx/mobx.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    this.params,
  }) : super(key: key);

  final ProfileParams? params;
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> with Messages {
  final ProfileStore store = Modular.get();

  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    statusReactionDisposer = reaction(
      (_) => store.profileStatus,
      (status) {
        switch (status) {
          case PageStateStatus.loading:
            break;
          case PageStateStatus.failure:
            showError(
              store.errorMessage!,
            );
            break;
          default:
            break;
        }
      },
    );
    store.initClass(widget.params?.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder: (context) {
          return store.loginInLoading
              ? Center(
                  child: LoadingAnimationWidget.discreteCircle(
                      color: primary, size: 60),
                )
              : Scaffold(
                  body: Column(
                    children: <Widget>[
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.account_circle_rounded,
                                  size: 120,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 40,
                            child: PopupMenuButton(
                              constraints:
                                  BoxConstraints(minWidth: 80, maxHeight: 70),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: borderGrey,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              offset: Offset(0, 38),
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    height: 28,
                                    padding: EdgeInsets.zero,
                                    onTap: () {
                                      Modular.to.pushNamed('/profileDetail');
                                    },
                                    child: Container(
                                      height: 28,
                                      alignment: Alignment.center,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: borderGrey,
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          CustomText(
                                            textType: TypographyType.xsBold,
                                            text: 'Editar',
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    height: 26,
                                    padding: EdgeInsets.zero,
                                    onTap: () => store.logout(),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: CustomText(
                                          textType: TypographyType.xsBold,
                                          text: 'Sair',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ];
                              },
                            ),
                          ),
                        ],
                      ),
                      Observer(builder: (context) {
                        return CustomText(
                          textType: TypographyType.lgBold,
                          text: store.user?.username ?? 'UserName',
                        );
                      }),
                      SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        textType: TypographyType.xsRegular,
                        text: '@${store.user?.username ?? 'UserName'}',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Observer(
                        builder: (context) {
                          return Row(
                            children: [
                              Expanded(
                                child: SelectViewState(
                                  onTap: () {
                                    store.changePageState(PageState.Post);
                                  },
                                  isSelect: store.pageState == PageState.Post,
                                  borderLeft: false,
                                  quantity: store.posts.length,
                                  title: 'Post',
                                ),
                              ),
                              Expanded(
                                child: SelectViewState(
                                  onTap: () {
                                    store.changePageState(PageState.Likes);
                                  },
                                  isSelect: store.pageState == PageState.Likes,
                                  borderLeft: true,
                                  quantity: store.likedPosts.length,
                                  title: 'Likes',
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: store.pageState == PageState.Post
                                ? store.posts.length
                                : store.likedPosts.length,
                            itemBuilder: (context, index) {
                              final post = store.pageState == PageState.Post
                                  ? store.posts[index]
                                  : store.likedPosts[index];
                              return Container(
                                width: context.screenWidth / 2,
                                height: 64,
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    post.imageUrl,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return SizedBox(
                                        height: 280,
                                        child: Center(
                                          child: LoadingAnimationWidget
                                              .discreteCircle(
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
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
