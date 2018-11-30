import 'package:flutter/material.dart';

abstract class IsLcwAssistUIPage{
  Future<void> executeAfterBuild();
  loaded(BuildContext context);
  
}