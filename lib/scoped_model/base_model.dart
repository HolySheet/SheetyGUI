import 'package:scoped_model/scoped_model.dart';
import 'package:sheety_gui/enums/view_states.dart';

///
/// A model that handles the [ViewState] and basic navigation.
///
class BaseModel extends Model {
  ViewState _state;
  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
}
