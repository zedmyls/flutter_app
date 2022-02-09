import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

mixin GetParamsMixin<T> {
  T initParams();

  late final Rx<T> _params = Rx<T>(initParams());

  set params(T params) {
    _params.value = params;
  }

  T get params => _params.value;

  Rx<T> get obsParams => _params;
}
