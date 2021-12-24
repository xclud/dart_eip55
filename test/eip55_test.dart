import 'package:test/test.dart';

import 'package:eip55/eip55.dart';

void main() {
  test('EIP Checksum', () {
    expect(toEIP55Address('0x68775f2604f67a571f626c99ae4eb252b579dcd7'),
        '0x68775F2604F67a571f626C99Ae4Eb252B579dCd7');
  });
}
