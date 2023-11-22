// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meme_hub/app/core/global/enum/enums.dart';
import 'package:meme_hub/app/core/ui/atons/buttons/custom_button.dart';
import 'package:meme_hub/app/core/ui/atons/text_field/custom_text_field.dart';
import 'package:meme_hub/app/core/ui/atons/typography/custom_text.dart';
import 'package:meme_hub/app/core/ui/atons/typography/typography.dart';
import 'package:meme_hub/app/core/ui/mixin/messages.dart';
import 'package:meme_hub/app/core/ui/styles/colors_app.dart';
import 'package:meme_hub/app/modules/adding_post/addingPost_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class AddingPostPage extends StatefulWidget {
  final String title;
  const AddingPostPage({Key? key, this.title = 'AddingPostPage'})
      : super(key: key);
  @override
  AddingPostPageState createState() => AddingPostPageState();
}

class AddingPostPageState extends State<AddingPostPage> with Messages {
  final titleController = TextEditingController();

  final AddingPostStore store = Modular.get();
  final ImagePicker _picker = ImagePicker();
  late final ReactionDisposer statusReactionDisposer;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    statusReactionDisposer = reaction(
      (_) => store.addingPostStatus,
      (status) {
        switch (status) {
          case PageStateStatus.loading:
            break;
          case PageStateStatus.success:
            Modular.to.navigate('/main/home');
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
    super.initState();
  }

  XFile? imageFile;
  Future<void> openGalery() async {
    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() => imageFile = file);
    }
  }

  int get textSize => titleController.text.length;

  bool inLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 53,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: borderGrey,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 27, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            textType: TypographyType.smMedium,
                            text: 'Nova postagem',
                          ),
                          IconButton(
                            onPressed: () {
                              Modular.to.navigate('/main/home');
                            },
                            icon: const Icon(
                              Icons.close,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 27),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        textType: TypographyType.smBold,
                        text: 'Nova postagem',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CustomTextField(
                        enable: inLoading ? false : true,
                        controller: titleController,
                        hintText: 'Diga algo sobre sua postagem...',
                        onChanged: (value) => setState(() {}),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, digite algo';
                          }

                          if (value.length > 50) {
                            return 'Máximo de 50 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomText(
                        textType: TypographyType.xsMedium,
                        text: '$textSize/50 caracteres',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 27),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        textType: TypographyType.smBold,
                        text: 'Selecione uma imagem para a sua postagem',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 396,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: borderGrey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: imageFile != null
                        ? Stack(
                            children: [
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(
                                      imageFile!.path,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () => setState(() => imageFile = null),
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 4),
                                    decoration: const BoxDecoration(
                                      color: borderGrey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/edit.svg'),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const CustomText(
                                            textType: TypographyType.xsMedium,
                                            text: 'Editar',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        : InkWell(
                            onTap: () => openGalery(),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: SvgPicture.asset(
                                      'assets/svg/add_photo.svg',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  CustomButton(
                                    onTap: () => openGalery(),
                                    width: 187,
                                    text: 'Selecionar Foto',
                                    textColor: primary,
                                    borderColor: primary,
                                  )
                                ],
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CustomButton.primary(
                onTap: inLoading
                    ? null
                    : () async {
                        if (!formKey.currentState!.validate() ||
                            imageFile == null) {
                          return;
                        }
                        setState(() => inLoading = true);
                        await store.uploadFile(
                          titleController.text,
                          imageFile!,
                        );
                        setState(() => inLoading = false);
                      },
                text: 'Postar',
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
