import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> getImage() async {
  final XFile? file = await ImagePicker().pickImage(
    source: ImageSource.gallery, // 图库选择
    maxWidth: 1000.0, // 设置图片最大宽度，间接压缩了图片的体积
  );
  /// 选取图片失败file为null，要注意判断下。
  /// 获取图片路径后可以上传到服务器上
  // print('${file?.path}');
  if(file?.path != null){
    return file!.path;
  }
  return " ";
}

Future<PermissionStatus> requestPermission(List<Permission> permissionList) async {
  Map<Permission, PermissionStatus> statuses = await permissionList.request();
  PermissionStatus currentPermissionStatus = PermissionStatus.granted;
  statuses.forEach((key, value) {
    if (!value.isGranted) {
      currentPermissionStatus = value;
      return;
    }
  });
  return currentPermissionStatus;
}