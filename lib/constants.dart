import 'package:emotions_ui/widgets/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Constants {
  static final color2 = Colors.pink[800];

  static String rate;

  static Future<void> launchUniversalLink(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  static Future<void> confirmCopyLink(BuildContext context,
      {String link,
      @required String title,
      @required String content,
      @required String defaultActionText,
      String cancelActionText}) async {
    final dialogRequestSignOut = await showAlertDialogue(
      context,
      title: title,
      content: content,
      defaultactiontext: defaultActionText,
      cancelactiontext: cancelActionText,
    );
    if (dialogRequestSignOut == true && link != null) {
      Constants.launchUniversalLink(link);
    } else {}
  }
}
