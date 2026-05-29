import 'dart:async';

import 'package:google_fonts/google_fonts.dart';

/// Global test configuration.
///
/// Disables Google Fonts runtime network fetching so that tests run
/// offline without attempting to download Plus Jakarta Sans or any
/// other font from fonts.gstatic.com. The font falls back to the
/// system default, which is fine for widget logic tests.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  GoogleFonts.config.allowRuntimeFetching = false;
  await testMain();
}
