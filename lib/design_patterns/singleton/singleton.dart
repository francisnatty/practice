class Debugger {
  static Debugger? _instance;

  Debugger._internal() {
    print('natty is a good boy');
  }

  static get instance {
    _instance ??= Debugger._internal();

    return _instance!;
  }
}

Debugger debuggerInstance = Debugger.instance;
