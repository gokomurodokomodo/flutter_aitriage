import 'package:get/get.dart';
import 'package:plugin_bluetooth_android/plugin_bluetooth_event_channel.dart';

class ExampleConnectDeviceController extends GetxController{
  var ecgWave = ''.obs;
  var spo2 = '--'.obs;
  var sys = '--'.obs;
  var resp = '0'.obs;
  var hr = '--'.obs;
  var cuff = '--'.obs;
  var temp = '--'.obs;
  var dia = '--'.obs;
  var heartRatePresent = '--'.obs;

  @override
  void onInit() {
    super.onInit();
    EnumAppEventChannel.spo2Event.getEventStream().listen((event) {
      spo2.value = event.toString();
    });
    EnumAppEventChannel.sysEvent.getEventStream().listen((event) {
      sys.value = event.toString();
    });
    EnumAppEventChannel.heartRateEvent.getEventStream().listen((event) {
      hr.value = event.toString();
    });
    EnumAppEventChannel.respEvent.getEventStream().listen((event) {
      resp.value = event.toString();
    });
    EnumAppEventChannel.cuffEvent.getEventStream().listen((event) {
      cuff.value = event.toString();
    });
    EnumAppEventChannel.tempEvent.getEventStream().listen((event) {
      temp.value = event.toString();
    });
    EnumAppEventChannel.diaEvent.getEventStream().listen((event) {
      dia.value = event.toString();
    });
    EnumAppEventChannel.heartRate.getEventStream().listen((event) {
      heartRatePresent.value = event.toString();
    });
  }



}