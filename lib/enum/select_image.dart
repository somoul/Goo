import 'package:image_picker/image_picker.dart';

enum SelectPhotoOption {
  camera(id: 1, title: 'Camera', source: ImageSource.camera),
  gallery(id: 2, title: 'Gallery', source: ImageSource.gallery),
  cancel(id: 3, title: 'Cancel');

  const SelectPhotoOption({required this.id, required this.title, this.source});

  final int id;
  final String title;
  final ImageSource? source;
}
