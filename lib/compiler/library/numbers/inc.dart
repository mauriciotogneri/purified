import 'package:dry/compiler/errors/runtime_error.dart';
import 'package:dry/compiler/models/parameter.dart';
import 'package:dry/compiler/runtime/reducible.dart';
import 'package:dry/compiler/runtime/scope.dart';
import 'package:dry/compiler/semantic/function_prototype.dart';

class Inc extends NativeFunctionPrototype {
  Inc()
      : super(
          name: 'inc',
          parameters: [
            Parameter.number('x'),
          ],
        );

  @override
  Reducible bind(Scope<Reducible> arguments) {
    final Reducible x = arguments.get('x').evaluate();

    if (x is NumberReducibleValue) {
      return NumberReducibleValue(x.value + 1);
    } else {
      throw InvalidArgumentTypesError(
        function: name,
        expected: parameters.map((e) => e.type.toString()).toList(),
        actual: [x.type],
      );
    }
  }
}
