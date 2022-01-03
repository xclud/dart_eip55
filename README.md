Utility to convert an upper or lower case Web3/Ethereum address to a checksum address (EIP55).

[![pub package](https://img.shields.io/pub/v/eip55.svg)](https://pub.dartlang.org/packages/eip55)

## Getting started

In your `pubspec.yaml` file add:

```dart
dependencies:
  eip55: any
```

## Usage

Import the package:

```dart
import 'package:eip55/eip55.dart';
```

Then:

```dart
final eip55Address = toEIP55Address('0x68775f2604f67a571f626c99ae4eb252b579dcd7');
```

Alternately:

```dart
final eip55Address = toChecksumAddress('0x68775f2604f67a571f626c99ae4eb252b579dcd7');
```
