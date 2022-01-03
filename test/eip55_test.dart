import 'package:test/test.dart';

import 'package:eip55/eip55.dart';

void main() {
  group('EIP Checksum', () {});
  test('0xF4512Cd9256E159358cb9A0D7fd4d54C1fA17B00', () {
    expect(toEIP55Address('0xF4512cd9256E159358cb9A0D7fd4d54C1fA17B00'),
        '0xF4512Cd9256E159358cb9A0D7fd4d54C1fA17B00');
  });

  test('0x68775f2604f67a571f626c99ae4eb252b579dcd7', () {
    expect(toEIP55Address('0x68775f2604f67a571f626c99ae4eb252b579dcd7'),
        '0x68775F2604F67a571f626C99Ae4Eb252B579dCd7');
  });
}
