import 'dart:typed_data';

class ImageVariationRequest {
  final String? image;
  final Uint8List? imageBytes;
  final int? n;
  final String? size;
  final String? responseFormat;
  final String? user;

  ImageVariationRequest({
    this.image,
    this.imageBytes,
    this.n,
    this.size,
    this.responseFormat,
    this.user,
  });
}
