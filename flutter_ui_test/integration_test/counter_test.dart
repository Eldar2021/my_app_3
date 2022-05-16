import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_test/src/constants/string/app_string.dart';
import 'package:flutter_ui_test/src/src.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:integration_test/integration_test.dart';
import 'package:flutter_ui_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'Counter Test',
    (tester) async {
      app.main();
      final tooltip = AppToolTip.instance;
      final string = AppString.instance;
      await tester.pumpAndSettle();
      expect(find.byTooltip(tooltip.addButton), findsOneWidget);
      final button = find.byTooltip(tooltip.addButton);

      await tester.tap(button);
      await tester.tap(button);
      await tester.tap(button);

      await tester.pump();

      expect(find.text('${string.cCount} 3'), findsOneWidget);
    },
  );
}
