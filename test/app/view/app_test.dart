import 'package:flutter_test/flutter_test.dart';
import 'package:waffarha_challenge/app/app.dart';
import 'package:waffarha_challenge/photos/presentation/page/photos_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(PhotosPage), findsOneWidget);
    });
  });
}
