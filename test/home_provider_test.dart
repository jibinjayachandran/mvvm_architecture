import 'package:flutter_test/flutter_test.dart';
import 'package:halian/config/service_locator.dart';
import 'package:halian/ui/features/home/providers/home_provider.dart';

void main(){
  late HomeProvider sut;

  setUp((){
    setUpLocators();
    sut  = HomeProvider();
  });

  test('initial values are correct', (){
    expect(sut.events, []);
    expect(sut.isLoading, false);
  });

  group('load events', () {
    test('load initial event list', () async{
      await sut.loadEventList('');
    });

  });
}