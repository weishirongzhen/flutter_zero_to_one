class ApiAddress {
  static const String baiDuApiAddress = 'https://aip.baidubce.com';

  ///获取授权token
  static const String getAccessToken = '/oauth/2.0/token';

  ///黑白图像上色
  static const String colourize = '/rest/2.0/image-process/v1/colourize';

  ///图像无损放大
  static const String image_quality_enhance = '/rest/2.0/image-process/v1/image_quality_enhance';

  ///图像去雾
  static const String dehaze = '/rest/2.0/image-process/v1/dehaze';

  ///图像对比度增强
  static const String contrast_enhance = '/rest/2.0/image-process/v1/contrast_enhance';

  ///拉伸图像恢复
  static const String stretch_restore = '/rest/2.0/image-process/v1/stretch_restore';
}
