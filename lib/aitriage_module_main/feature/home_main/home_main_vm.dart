import '../../../aitriage_core/entity/user_info.dart';
import '../../domain/entity/location.dart';

class HomeMainVM {
  var _userInfo = UserInfo();
  final _locations = <Location>[];
  var _locationIndex = 0;
  var _currentModuleIndex = 0;

  update({
    UserInfo? userInfo,
    List<Location>? locations,
    int? locationIndex,
    int? currentModuleIndex
  }) {
    _userInfo = userInfo ?? _userInfo;
    _locationIndex = locationIndex ?? _locationIndex;
    _currentModuleIndex = currentModuleIndex ?? _currentModuleIndex;

    if (locations != null) {
      _locations.clear();
      _locations.addAll(locations);
    }
  }

  String get userAvatar => _userInfo.avatar ?? '';

  String get userDisplayName => _userInfo.displayName ?? '';

  List<Location> get locations => _locations.toList();

  Location get currentLocation {
    if (_locationIndex < _locations.length) {
      return _locations[_locationIndex];
    } else {
      return Location.fromJson(null);
    }
  }

  String get currentLocationAvatar => currentLocation.avatar ?? '';

  String get currentModuleTitle => switch (_currentModuleIndex) {
        0 => 'ASSESSMENT',
        1 => 'PATIENT',
        _ => ''
      };
}