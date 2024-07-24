import 'package:dry/compiler/library/standard_library.dart';
import 'package:dry/compiler/semantic/function_prototype.dart';
import 'package:dry/compiler/warnings/generic_warning.dart';
import 'package:dry/utils/mapper.dart';

class IntermediateCode {
  final Map<String, FunctionPrototype> functions;
  final List<GenericWarning> warnings;

  IntermediateCode({
    required this.functions,
    required this.warnings,
  });

  factory IntermediateCode.empty() => IntermediateCode(
        functions: Mapper.toMap(StandardLibrary.get()),
        warnings: [],
      );
}
