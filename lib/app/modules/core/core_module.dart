import 'package:flutter_modular/flutter_modular.dart';
import 'package:meme_hub/app/core/api/api_cliente.dart';
import 'package:meme_hub/app/core/store/auth_settings.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => AuthSettings(),
          export: true,
        ),
        Bind.lazySingleton(
          (i) => ApiClient(),
          export: true,
        ),
      ];
}
