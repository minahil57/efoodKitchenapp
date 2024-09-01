import 'package:efood_kitchen/data/model/response/config_model.dart';
import 'package:efood_kitchen/data/repository/splash_repo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SplashController extends GetxController implements GetxService {
  final SplashRepo splashRepo;
  SplashController({required this.splashRepo});

  DateTime _currentTime = DateTime.now();

  DateTime get currentTime => _currentTime;
  bool _firstTimeConnectionCheck = true;
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;
  ConfigModel _configModel = ConfigModel();
  ConfigModel get configModel => _configModel;
  BaseUrls _baseUrls = BaseUrls();
  BaseUrls get baseUrls => _baseUrls;

  Future<Response> getConfigData() async {
    Response _response = await splashRepo.getConfigData();
    if ( _response.statusCode == 200) {
      _configModel = ConfigModel.fromJson(_response.body);
      _baseUrls = ConfigModel.fromJson(_response.body).baseUrls!;
      update();
    }
    return _response;
  }

  Future<bool> initSharedData() {
    return splashRepo.initSharedData();
  }

  Future<bool> removeSharedData() {
    return splashRepo.removeSharedData();
  }

  bool isRestaurantClosed() {
    DateTime _open = DateFormat('hh:mm').parse('');
    DateTime _close = DateFormat('hh:mm').parse('');
    DateTime _openTime = DateTime(_currentTime.year, _currentTime.month, _currentTime.day, _open.hour, _open.minute);
    DateTime _closeTime = DateTime(_currentTime.year, _currentTime.month, _currentTime.day, _close.hour, _close.minute);
    if(_closeTime.isBefore(_openTime)) {
      _closeTime = _closeTime.add(Duration(days: 1));
    }
    if(_currentTime.isAfter(_openTime) && _currentTime.isBefore(_closeTime)) {
      return false;
    }else {
      return true;
    }
  }


  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }
}
