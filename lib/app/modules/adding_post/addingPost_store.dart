import 'package:image_picker/image_picker.dart';
import 'package:meme_hub/app/core/global/enum/enums.dart';
import 'package:meme_hub/app/modules/adding_post/repositories/upload_post_repository.dart';
import 'package:mobx/mobx.dart';

part 'addingPost_store.g.dart';

class AddingPostStore = _AddingPostStoreBase with _$AddingPostStore;

abstract class _AddingPostStoreBase with Store {
  final UploadPostRepository uploadPostRepository;
  _AddingPostStoreBase(this.uploadPostRepository);

  @readonly
  var _addingPostStatus = PageStateStatus.loading;

  @computed
  bool get loginInLoading => _addingPostStatus == PageStateStatus.loading;

  @readonly
  String? _errorMessage;

  Future<void> uploadFile(String title, XFile xfile) async {
    _addingPostStatus = PageStateStatus.loading;
    try {
      await uploadPostRepository.uploadFile(title, xfile);
      _addingPostStatus = PageStateStatus.success;
    } on Exception catch (e) {
      _errorMessage = e.toString();
      _addingPostStatus = PageStateStatus.failure;
    }
  }
}
