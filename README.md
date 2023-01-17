# rounded_qr

An easy to use package for creating QR codes that can be rounded, and can have an image in the center. (Null safe version of [rounded_qr](https://pub.dev/packages/rounded_qr))

This package uses the actively maintained [qr](https://pub.dev/packages/qr) package under the hood.

## Usage

### Default

By default the modules in the QR code will have rounded corners with a radius of `4.0`.

```dart
import 'package:flutter/material.dart';
import 'package:rounded_qr_nullsafety/rounded_qr_nullsafety.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RoundedQR(
            data: 'https://github.com/mdshadatrahman',
          ),
        ),
      ),
    );
  }
}

```

### Squared

The radius of the modules is variable and can be removed completely by setting the `moduleRadius` and `backgroundRadius` parameters to `0.0`.

```dart
import 'package:flutter/material.dart';
import 'package:rounded_qr_nullsafety/rounded_qr_nullsafety.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RoundedQR(
            data: 'https://github.com/mdshadatrahman',
            moduleRadius: 0.0,
            backgroundRadius: 0.0,
          ),
        ),
      ),
    );
  }
}

```

### With image

Adding an image to the center can be done by simply passing an `NetworkImage` or `AssetImage` to the `image` parameter.

```dart
import 'package:flutter/material.dart';
import 'package:rounded_qr_nullsafety/rounded_qr_nullsafety.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RoundedQR(
            data: 'https://github.com/mdshadatrahman',
            image: const NetworkImage('https://avatars.githubusercontent.com/u/43848931?v=4'),
          ),
        ),
      ),
    );
  }
}

```

### Custom colors

Both the module color and the background color can be changed by setting the `moduleColor` and `backgroundColor` parameters respectively.

> Note that the module color needs to be darker then the background colors to work with most QR code scanners.

```dart
import 'package:flutter/material.dart';
import 'package:rounded_qr_nullsafety/rounded_qr_nullsafety.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RoundedQR(
            data: 'https://github.com/mdshadatrahman',
            moduleColor: Colors.blue,
            backgroundColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}

```

### QR version

The version can be changed to allow for more storage just by setting the `typeNumber` to the desired version (1 to 40.)

```dart
import 'package:flutter/material.dart';
import 'package:rounded_qr_nullsafety/rounded_qr_nullsafety.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RoundedQR(
            data: 'https://github.com/mdshadatrahman',
            typeNumber: 17,
          ),
        ),
      ),
    );
  }
}

```

### Error correction

The error correction level can be changed to allow more data bytes to be restored by setting the `errorCorrectLevel` to the desired level.

- Level L (Low) - 7% of data bytes can be restored.
- Level M (Medium) - 15% of data bytes can be restored.
- Level Q (Quartile) - 25% of data bytes can be restored.
- Level H (High) - 30% of data bytes can be restored.

```dart
import 'package:flutter/material.dart';
import 'package:rounded_qr_nullsafety/rounded_qr_nullsafety.dart';
import 'package:qr/qr.dart';// we will import the [QrErrorCorrectLevel] from the qr package

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RoundedQR(
            data: 'https://github.com/mdshadatrahman',
            errorCorrectLevel: QrErrorCorrectLevel.H,
          ),
        ),
      ),
    );
  }
}

```

## Licence

This Flutter package is made available under a [MIT license](https://github.com/mdshadatrahman/rounded-qr-flutter/blob/main/LICENSE).
