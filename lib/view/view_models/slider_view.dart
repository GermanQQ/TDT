import 'package:flutter_tdt/core/domain/enums/enums.dart';
import 'package:flutter_tdt/core/models/slider_item_data.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/core/network/firebase_api.dart';
import 'package:flutter_tdt/locator.dart';
import 'package:flutter_tdt/view/view_models/base_view.dart';

class SliderView extends BaseView {
  int currentIndex = 0;
  List<SliderItemData> sliderData = [];

  changeIndexSlide(int index) {
    currentIndex = index;
    refresh();
  }

  void loadData() async {
    applyState(ViewState.Busy);
    sliderData = await locator<FirebaseAPI>().getSliderData();
    applyState(ViewState.Idle);
  }

  void onPressLogin(){
    locator<Routes>().tapOnLogin(true);
  }
  void onPressRegister(){
    locator<Routes>().tapOnRegister(true);
  }
}
