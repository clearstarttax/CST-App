import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/onboarding_screen_three_screen/models/onboarding_screen_three_model.dart';

/// A controller class for the OnboardingScreenThreeScreen.
///
/// This class manages the state of the OnboardingScreenThreeScreen, including the
/// current onboardingScreenThreeModelObj
class OnboardingScreenThreeController extends GetxController {
  Rx<OnboardingScreenThreeModel> onboardingScreenThreeModelObj =
      OnboardingScreenThreeModel().obs;
}
