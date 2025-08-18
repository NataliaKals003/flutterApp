// valueNtifier for managing the current index in a navigation bar
// value listenable builder for listening to changes in the current index
import 'package:flutter/material.dart';

ValueNotifier selectedPageNotifier = ValueNotifier<int>(0);
ValueNotifier isDarkModeNotifier = ValueNotifier<bool>(false);
