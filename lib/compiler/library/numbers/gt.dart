import 'package:dry/compiler/errors/runtime_error.dart';
import 'package:dry/compiler/models/parameter.dart';
import 'package:dry/compiler/models/reducible.dart';
import 'package:dry/compiler/models/scope.dart';
import 'package:dry/compiler/semantic/function_prototype.dart';

class Gt extends NativeFunctionPrototype {
  Gt()
      : super(
          name: 'gt',
          parameters: [
            Parameter.number('x'),
            Parameter.number('y'),
          ],
        );

  @override
  Reducible evaluate(Scope scope) {
    final Reducible x = scope.get('x').evaluate(scope);
    final Reducible y = scope.get('y').evaluate(scope);

    if ((x is NumberReducibleValue) && (y is NumberReducibleValue)) {
      return BooleanReducibleValue(x.value > y.value);
    } else {
      throw InvalidArgumentTypesError(
        function: name,
        expected: parameters.map((e) => e.type.toString()).toList(),
        actual: [x.type, y.type],
      );
    }
  }
}