import 'package:flutter/material.dart';

Size displySize(BuildContext context){
  return MediaQuery.of(context).size;
}
double displyHeight(BuildContext context){
  return displySize(context).height;
}
double displyWidth(BuildContext context){
  return displySize(context).width;
}
