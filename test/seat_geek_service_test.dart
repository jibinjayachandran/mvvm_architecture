
import 'package:flutter_test/flutter_test.dart';
import 'package:halian/config/service_locator.dart';
import 'package:halian/services/seat_geek_service.dart';
import 'package:mocktail/mocktail.dart';

class MockSeatGeekService extends Mock implements SeatGeekService{}
void main(){
  late MockSeatGeekService sut;

  setUp((){
    setUpLocators();
    sut  = MockSeatGeekService();
  });

  group('MockSeatGeekService test', () {
    test('calling getEvents', () async{
      await sut.getEvents(query: '');
      verify(()=>sut.getEvents(query: '')).called(1);
    });

  });
}