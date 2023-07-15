import 'package:url_launcher/url_launcher.dart';
//import 'package:url_launcher/url_launcher_string.dart';

class NavigationUtils {
  static void navigateTo(String fullAddress) async {
    String query = Uri.encodeComponent(fullAddress);
    String googleUrl = "google.navigation:q=$query";
    Uri googleUri = Uri.parse(googleUrl);

    try {
      if (await canLaunchUrl(googleUri)) {
        await launchUrl(googleUri);
      }
    } catch (e) {
      print(e);
      throw ("Error Launching Maps");
    }
  }
}
