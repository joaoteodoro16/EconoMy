
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskUtil {
  
  MaskUtil._();

  static MaskTextInputFormatter  get maskDateFormat  => MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
  );
}