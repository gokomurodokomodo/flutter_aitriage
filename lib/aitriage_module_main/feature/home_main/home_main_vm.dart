import '../../../aitriage_core/entity/user_info.dart';
import '../../domain/entity/location.dart';

class HomeMainVM {
  var _userInfo = UserInfo();
  final _locations = <Location>[];
  var _locationIndex = 0;

  update({
    UserInfo? userInfo,
    List<Location>? locations,
    int? locationIndex
  }) {
    _userInfo = userInfo ?? _userInfo;
    _locationIndex = locationIndex ?? _locationIndex;

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
}