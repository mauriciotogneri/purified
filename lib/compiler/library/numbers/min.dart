import 'dart:math';
import 'package:dry/compiler/errors/runtime_error.dart';
import 'package:dry/compiler/models/parameter.dart';
import 'package:dry/compiler/runtime/reducible.dart';
import 'package:dry/compiler/runtime/scope.dart';
import 'package:dry/compiler/semantic/function_prototype.dart';

class Min extends NativeFunctionPrototype {
  Min()
      : super(
          name: 'min',
          parameters: [
            Parameter.number('x'),
            Parameter.number('y'),
          ],
        );

  @override
  Reducible bind(Scope<Reducible> arguments) {
    final Reducible x = arguments.get('x').evaluate();
    final Reducible y = arguments.get('y').evaluate();

    if ((x is NumberReducibleValue) && (y is NumberReducibleValue)) {
      return NumberReducibleValue(min(x.value, y.value));
    } else {
      throw InvalidArgumentTypesError(
        function: name,
        expected: parameters.map((e) => e.type.toString()).toList(),
        actual: [x.type, y.type],
      );
    }
  }
}