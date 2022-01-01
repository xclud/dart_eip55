library eip55;

import 'dart:typed_data';

import 'package:pointycastle/export.dart';

/// Converts an upper or lower case Web3/Ethereum address to a checksum address (EIP55).
String toChecksumAddress(String address) => toEIP55Address(address);

/// Converts an upper or lower case Web3/Ethereum address to a checksum address (EIP55).
String toEIP55Address(String address) {
  bool startsWith0x = address.startsWith('0x') || address.startsWith('0X');
  if (startsWith0x) {
    address = address.substring(2);
  }

  var keccak = KeccakDigest(256);
  keccak.update(Uint8List.fromList(address.toLowerCase().codeUnits), 0,
      address.codeUnits.length);

  var out = Uint8List(32);
  keccak.doFinal(out, 0);
  var sha = _toHex(out);

  var o = <int>[];

  if (startsWith0x) {
    o.add(0x30);
    o.add(0x78);
  }

  for (int i = 0; i < address.length; i++) {
    var n = int.parse(sha[i], radix: 16);
    if (n > 8) {
      o.add(address[i].toUpperCase().codeUnits.first);
    } else {
      o.add(address[i].toLowerCase().codeUnits.first);
    }
  }

  return String.fromCharCodes(o);
}

/// Character `0`.
const int _zero = 0x30;

/// Character `a`.
const int _a = 0x61;

/// Returns the ASCII/Unicode code unit corresponding to the hexadecimal digit
/// [digit].
int _codeUnitForDigit(int digit) =>
    digit < 10 ? digit + _zero : digit + _a - 10;

String _toHex(List<int> bytes) {
  final buffer = Uint8List(bytes.length * 2);

  int bufferIndex = 0;
  for (var i = 0; i < bytes.length; i++) {
    var byte = bytes[i];

    // The bitwise arithmetic here is equivalent to `byte ~/ 16` and `byte % 16`
    // for valid byte values, but is easier for dart2js to optimize given that
    // it can't prove that [byte] will always be positive.
    buffer[bufferIndex++] = _codeUnitForDigit((byte & 0xF0) >> 4);
    buffer[bufferIndex++] = _codeUnitForDigit(byte & 0x0F);
  }

  return String.fromCharCodes(buffer);
}
