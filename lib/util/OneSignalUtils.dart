import 'package:flutter_app/util/Session.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalUtils {
  
  void init() {
    OneSignal.shared.init("19e231a3-99fc-4326-81f1-b31b462671c2", iOSSettings: {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.inAppLaunchUrl: true
    });
    getUserId();
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);
    print("iniciei o OneSignal!");
  }

  void main() {
    OneSignal.shared
        .setNotificationReceivedHandler(_handleNotificationReceived);
  }

  void _handleNotificationReceived(OSNotification notification) {
    print(notification);
  }

  void getUserId() async {
    var status = await OneSignal.shared.getPermissionSubscriptionState();
    Session().oneSignalUserID = status.subscriptionStatus.userId;
  }
}
