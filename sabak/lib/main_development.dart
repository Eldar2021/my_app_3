import 'package:sabak/bootstrap.dart';
import 'package:sabak/locator.dart';

import 'src/src.dart';

void main() {
  setup();
  bootstrap(() => const App());
}
