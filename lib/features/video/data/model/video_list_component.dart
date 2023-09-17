import 'package:flutter/material.dart';

class CustomChips {
  final IconData icon;
  final int value;
  final String text;

  CustomChips({required this.icon, required this.text, required this.value});
}

class VideoListComponentModel {
  final String name;
  final String imageUri;
  final String timesAgo;
  final String videoUrl;
  final CustomChips customChips;

  VideoListComponentModel(
      {required this.name,
      required this.imageUri,
      required this.timesAgo,
      required this.videoUrl,
      required this.customChips});
}
