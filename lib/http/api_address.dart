class ApiAddress {
  static const String baiDuApiAddress = 'https://aip.baidubce.com';

  ///获取授权token
  static const String getAccessToken = '/oauth/2.0/token';

  ///植物识别
  static const String plant = '/rest/2.0/image-classify/v1/plant';

  ///动物识别
  static const String animal = '/rest/2.0/image-classify/v1/animal';

}
