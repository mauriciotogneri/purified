import 'package:dry/compiler/models/parameter.dart';
import 'package:dry/compiler/runtime/reducible.dart';
import 'package:dry/compiler/runtime/scope.dart';
import 'package:dry/compiler/semantic/function_prototype.dart';

class ToString extends NativeFunctionPrototype {
  ToString()
      : super(
          name: 'toString',
          parameters: [
            Parameter.any('x'),
          ],
        );

  @override
  Reducible bind(Scope<Reducible> arguments) {
    final Reducible x = arguments.get('x').evaluate();

    return StringReducibleValue(x.toString());
  }
}