import '../files.dart';

class LoginState with ChangeNotifier {
  bool _isPressed = false;

  bool get isPressed => _isPressed;

  set pressButton(value) {
    _isPressed = value;
    notifyListeners();
  }
}
