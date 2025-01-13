import '../../model/tokens/token.dart';
import '../token_import_file_processor/token_import_file_processor_interface.dart';

mixin TokenImportProcessor<T, V> {
  static Set<TokenImportProcessor> implementations = {
    ...TokenImportFileProcessor.implementations,
  };

  Future<List<Token>> processTokenMigrate(T data, {V args});
}
