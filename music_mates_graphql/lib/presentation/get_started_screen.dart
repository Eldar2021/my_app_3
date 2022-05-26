import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/constants.dart';
import '../main.dart';
import 'select_favourite_artist.dart';
import 'widgets/google_button.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final googleSignin = GoogleSignIn();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png",
              width: 120,
              height: 120,
            ),
            AppSpacing.v24,
            GoogleButton(
              onPressed: () => _googleButtonPressed(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _googleButtonPressed(BuildContext context) async {
    final selectedArtist = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SelectFavouriteArtist(),
        fullscreenDialog: true,
      ),
    );

    if (selectedArtist == null) return;

    // ignore: use_build_context_synchronously
    Navigator.popAndPushNamed(context, Routes.home);
  }
}
