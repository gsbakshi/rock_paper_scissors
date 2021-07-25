import 'dart:io';
import 'dart:math';

enum Moves {
  Rock,
  Paper,
  Scissors,
}

void main() {
  while (true) {
    title();
    statement('**', 'Press q to quit the game');
    stdout.write('Select Rock, Paper or Scissors? (r/p/s)  :    ');
    final input = stdin.readLineSync();
    if (input == 'r' ||
        input == 'R' ||
        input == 'p' ||
        input == 'P' ||
        input == 's' ||
        input == 'S') {
      final player = playerMove(input);
      final ai = aiMove();
      tally(player, ai);
    } else if (input == 'q') {
      print('---------------------------------------------------------------- \n Quiting... \n----------------------------------------------------------------');
      break;
    } else {
      statement('!!', '     Invalid Input      ');
    }
  }
}

void tally(Moves player, Moves ai) {
  print('You played: ${stringyfiedMove(player)}');
  print('AI played: ${stringyfiedMove(ai)}');
  if (player == ai) {
    result('  Draw  ');
  } else if ((player == Moves.Rock && ai == Moves.Scissors) ||
      (player == Moves.Paper && ai == Moves.Rock) ||
      (player == Moves.Scissors && ai == Moves.Paper)) {
    result('You won!');
  } else {
    result('You lose');
  }
}

Moves aiMove() {
  late Moves aiMove;
  final randomInt = Random().nextInt(3);
  aiMove = Moves.values[randomInt];
  return aiMove;
}

Moves playerMove(String? input) {
  late Moves playerMove;
  switch (input) {
    case 'r':
    case 'R':
      playerMove = Moves.Rock;
      break;
    case 'p':
    case 'P':
      playerMove = Moves.Paper;
      break;
    case 's':
    case 'S':
      playerMove = Moves.Scissors;
      break;
    default:
      statement('%%', 'Something went wrong');
      break;
  }
  return playerMove;
}

void title() {
  print('''

================================================================================================
================================  Playing Rock, Paper, Scissors ================================
================================================================================================

    ''');
}

void statement(String symbol, String text) {
  print('''
      
///////////////////////////////////////////////////////////////////////////////////////////////
${symbol}--------  ${text}  ------------------------------------------------------${symbol}
//////////////////////////////////////////////////////////////////////////////////////////////
      ''');
}

void result(String text) {
  print('''

||--------------------------------------------------------------------------------------------||
||--------------------------------------------------------------------------------------------||
||----------------                          ${text}                          ----------------||
||--------------------------------------------------------------------------------------------||
||--------------------------------------------------------------------------------------------||
      ''');
}

String stringyfiedMove(Moves move) {
  late String value;
  switch (move) {
    case Moves.Rock:
      value = 'Rock';
      break;
    case Moves.Paper:
      value = 'Paper';
      break;
    case Moves.Scissors:
      value = 'Scissors';
      break;
    default:
      value = 'Something went wrong';
      break;
  }
  return value;
}
