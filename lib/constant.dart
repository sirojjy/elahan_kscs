import 'dart:ui';
///Colors
const defaultPadding = 10.0;
const primaryColor = Color(0xff116530);
const secondaryColor = Color(0xff18A558);
const thirdColor = Color(0xffA3EBB1);
const fourthColor = Color(0xff21B6A8);

///API Constant
class ApiConstant {
  static String baseUrl = 'http://123.100.226.123:1445/index.php/Mobile';
  static String authentication = '$baseUrl/login';
  static String dashboard = '$baseUrl/dashboard';
  static String inventarisasi = '$baseUrl/inventarisasi';
}