// Native (dart:io) implementation of platform detection helpers.
// This file is loaded on all non-web platforms.
import 'dart:io' show Platform;

bool get isAndroid => Platform.isAndroid;
bool get isIOS => Platform.isIOS;
bool get isWindows => Platform.isWindows;
bool get isMacOS => Platform.isMacOS;
bool get isLinux => Platform.isLinux;
