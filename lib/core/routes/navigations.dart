import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';





pop(BuildContext context) {
  context.pop();
}

pushTo(BuildContext context, String path, {Object? extra}) {
  context.push(path, extra: extra);
}

pushReplacementTo(BuildContext context, String path, {Object? extra}) {
  context.pushReplacement(path, extra: extra);
}

pushToBase(BuildContext context, String path, {Object? extra}) {
  context.go(path, extra: extra);
}

