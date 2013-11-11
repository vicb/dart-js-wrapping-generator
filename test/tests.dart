import 'dart:io';

import 'package:js_wrapping_generator/dart_generator.dart';
import 'package:path/path.dart' as p;
import 'package:unittest/unittest.dart';

Generator _generator = new Generator('packages');

main() {
  new Directory('templates').listSync()
    ..sort((f1,f2) => f1.path.compareTo(f2.path))
    ..where((e) => FileSystemEntity.isFileSync(e.path)).forEach((f){
      test(f.path, () {
        final fileName = p.basename(f.path);
        final genDir = new Directory('generated-files')..createSync();
        try {
          _generator.transformFile(f, f, genDir);
          expect(new File(p.join(genDir.path, fileName)).readAsStringSync(),
              equals(new File(p.join('expected-files', fileName)).readAsStringSync()));
        } finally {
          if (genDir.existsSync()) genDir.deleteSync(recursive: true);
        }
      });
    });
}