import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maps_plugin/maps_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('maps_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await MapsPlugin.platformVersion, '42');
  });
}
