// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:stagexl/stagexl.dart';

import 'util.dart';

late ResourceManager _resourceManager;

const _win = 'win',
    _click = 'click',
    _pop = 'Pop',
    _flag = 'flag',
    _unFlag = 'unflag',
    _bomb = 'Bomb',
    _throwDart = 'throw';

void initialize(ResourceManager resourceManager) {
  _resourceManager = resourceManager;
}

void win() => _playAudio(_win);

void click() => _playAudio(_click);

void pop() => _playAudio(_pop);

void flag() => _playAudio(_flag);

void unFlag() => _playAudio(_unFlag);

void bomb() => _playAudio(_bomb);

void throwDart() => _playAudio(_throwDart);

void _playAudio(String name) {
  assert(_resourceManager != null, 'Not initialized');
  switch (name) {
    case _pop:
      final i = random.nextInt(8);
      name = '$_pop$i';
      break;
    case _bomb:
      final i = random.nextInt(4);
      name = '$_bomb$i';
      break;
  }
  _resourceManager.getSoundSprite('audio').play(name);
}
