import 'dart:js' as js;
import 'dart:html' as html;

import 'package:js_wrapping_generator/dart_generator.dart';
import 'package:js_wrapping/js_wrapping.dart' as jsw;

class Enum extends jsw.IsEnum<int> {
  static Enum $wrap(int jsValue) => _FINDER.find(jsValue);

  static final E1 = new Enum._(1);

  static final _FINDER = new jsw.EnumFinder<int, Enum>([E1]);

  Enum._(int value) : super(value);
}

@wrapper class Person extends jsw.TypedJsObject {
  String f1;
  @forMethods String f2;
  String f3, f4;
  Person f5;
  List<Person> f6;
  List<String> f7;
  List f8;
  @namesWithUnderscores String f9Rox;
  Enum f10;
  @Types(const [html.Node, String]) dynamic f11;
}