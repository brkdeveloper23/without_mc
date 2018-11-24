import 'package:flutter/material.dart';

abstract class IsLcwAssistUIPage{
  Future<void> executeAfterBuild();
  Future loaded(BuildContext context);
  
}