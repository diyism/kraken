/*
 * Copyright (C) 2019 Alibaba Inc. All rights reserved.
 * Author: Kraken Team.
 */

import 'package:kraken/bridge.dart';

const DART = 'D';
const CPP = 'C';
const JS = 'J';

const FRAME_BEGIN = '\$';
const FETCH_MESSAGE = 's';
const TIMEOUT_MESSAGE = 't';
const INTERVAL_MESSAGE = 'i';
const ANIMATION_FRAME_MESSAGE = 'a';
const SCREEN_METRICS = 'm';
const WINDOW_LOAD = 'l';
const WINDOW_INIT_DEVICE_PIXEL_RATIO = 'r';

abstract class Message {
  final String _data;

  Message(this._data);

  send();

  static buildMessage(String key, String value) {
    return "$key=$value;";
  }
}

class JSMessage extends Message {
  JSMessage(String data) : super(data);

  send() {
    return invokeKrakenCallback(DART + JS + _data);
  }
}
