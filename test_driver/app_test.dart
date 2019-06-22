// Imports the Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('main screen', () {
    FlutterDriver driver;

//    final counterTextFinder = find.byValueKey('slide');
    final introscreen = find.byValueKey('intro');
    final requiredtext = find.byValueKey('signintext');

    Future<void> tap(SerializableFinder element) async {
      await driver.tap(element);
    }

    Future<void> type(SerializableFinder element, String text) async {
      await tap(element);
      await driver.enterText(text);
    }

    SerializableFinder findByKey(String key) {
      return find.byValueKey(key);
    }

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('tap on the button, verify result', () async {
      await driver.tap(introscreen);
      print("button1 pressed");
    });

    test('check the text', () async {
      expect(await driver.getText(requiredtext),
          "It's dangerous to go alone,grab a bud ");
      print("this test passed succefully");
    });

    test('pressing the login button', () async {
      final signinbutton = find.byValueKey('sparta');

      // First, tap the button.
      await driver.tap(signinbutton);

      print("signinbutton pressed succefully");
    });
  });
}
