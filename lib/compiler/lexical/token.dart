import 'package:dry/compiler/errors/lexical_error.dart';
import 'package:dry/compiler/input/location.dart';
import 'package:dry/compiler/lexical/lexical_analyzer.dart';
import 'package:dry/extensions/string_extensions.dart';

class Token extends Localized {
  final TokenType type;
  final String value;

  const Token._({
    required this.type,
    required this.value,
    required super.location,
  });

  String get asString => value;

  num get asNumber => num.parse(value);

  bool get asBoolean => bool.parse(value);

  factory Token.string(Lexeme lexeme) => Token._(
        type: TokenType.string,
        value: lexeme.value,
        location: lexeme.location,
      );

  factory Token.number(Lexeme lexeme) => Token._(
        type: TokenType.number,
        value: lexeme.value,
        location: lexeme.location,
      );

  factory Token.boolean(Lexeme lexeme) {
    return Token._(
      type: TokenType.boolean,
      value: lexeme.value,
      location: lexeme.location,
    );
  }

  factory Token.symbol(Lexeme lexeme) => Token._(
        type: TokenType.symbol,
        value: lexeme.value,
        location: lexeme.location,
      );

  factory Token.comma(Lexeme lexeme) => Token._(
        type: TokenType.comma,
        value: lexeme.value,
        location: lexeme.location,
      );

  factory Token.equals(Lexeme lexeme) => Token._(
        type: TokenType.equals,
        value: lexeme.value,
        location: lexeme.location,
      );

  factory Token.openParenthesis(Lexeme lexeme) => Token._(
        type: TokenType.openParenthesis,
        value: lexeme.value,
        location: lexeme.location,
      );

  factory Token.closeParenthesis(Lexeme lexeme) => Token._(
        type: TokenType.closeParenthesis,
        value: lexeme.value,
        location: lexeme.location,
      );

  factory Token.separator(Lexeme lexeme) {
    final String value = lexeme.value;

    if (value.isComma) {
      return Token.comma(lexeme);
    } else if (value.isEquals) {
      return Token.equals(lexeme);
    } else if (value.isOpenParenthesis) {
      return Token.openParenthesis(lexeme);
    } else if (value.isCloseParenthesis) {
      return Token.closeParenthesis(lexeme);
    } else {
      throw LexicalError.invalidLexeme(lexeme);
    }
  }

  @override
  String toString() =>
      'Token{type: ${type.name}, value: $value, location: $location}';
}

enum TokenType {
  string,
  number,
  boolean,
  symbol,
  comma,
  equals,
  openParenthesis,
  closeParenthesis;

  bool get isString => this == string;

  bool get isNumber => this == number;

  bool get isBoolean => this == boolean;

  bool get isSymbol => this == symbol;

  bool get isComma => this == comma;

  bool get isEquals => this == equals;

  bool get isOpenParenthesis => this == openParenthesis;

  bool get isCloseParenthesis => this == closeParenthesis;
}
