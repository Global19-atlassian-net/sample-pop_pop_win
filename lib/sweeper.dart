#library('sweeper');

#import('dart:math', prefix:'math');

#source('sweeper/field.dart');
#source('sweeper/game.dart');
#source('sweeper/game_state.dart');
#source('sweeper/square_state.dart');

void require(bool truth, [String message = '']) {
  if(!truth) {
    throw new Exception(message);
  }
}
