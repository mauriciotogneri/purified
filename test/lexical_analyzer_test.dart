import 'package:dry/compiler/lexical_analyzer.dart';
import 'package:dry/models/token.dart';
import 'package:test/test.dart';

void main() {
  List<Token> _tokens(String source) {
    final LexicalAnalyzer lexicalAnalyzer = LexicalAnalyzer(source: source);

    return lexicalAnalyzer.analyze();
  }

  void _check(List<Token> actual, List<String> expected) {
    expect(actual.length, equals(expected.length));

    for (int i = 0; i < actual.length; i++) {
      expect(actual[i].value, equals(expected[i]));
    }
  }

  group('Lexical Analyzer', () {
    test('String', () {
      final List<Token> tokens = _tokens('"This is a string"');
      _check(tokens, ['This is a string']);
    });

    test('Number', () {
      final List<Token> tokens = _tokens('42');
      _check(tokens, ['42']);
    });

    test('Boolean', () {
      final List<Token> tokens = _tokens('true');
      _check(tokens, ['true']);
    });

    test('Boolean', () {
      final List<Token> tokens = _tokens('false');
      _check(tokens, ['false']);
    });

    test('Symbol', () {
      final List<Token> tokens = _tokens('isEven');
      _check(tokens, ['isEven']);
    });

    test('Comma', () {
      final List<Token> tokens = _tokens(',');
      _check(tokens, [',']);
    });

    test('Open parenthesis', () {
      final List<Token> tokens = _tokens('(');
      _check(tokens, ['(']);
    });

    test('Close parenthesis', () {
      final List<Token> tokens = _tokens(')');
      _check(tokens, [')']);
    });

    test('Equals', () {
      final List<Token> tokens = _tokens('=');
      _check(tokens, ['=']);
    });

    test('Constant declaration', () {
      final List<Token> tokens = _tokens('pi = 3.14');
      _check(tokens, ['pi', '=', '3.14']);
    });

    test('Function definition', () {
      final List<Token> tokens = _tokens('main = isEven(4)');
      _check(tokens, ['main', '=', 'isEvent', '(', '4', ')']);
    });

    test('Function definition', () {
      final List<Token> tokens = _tokens('isEven(x) = eq(mod(x, 2), 0)');
      _check(tokens, ['isEven', '(', 'x', ')', '=', 'eq', '(', 'mod', '(', 'x', ',', '2', ')', ',', '0', ')']);
    });
  });
}
