import 'package:bookia/feature/profile/profilemain/presenatation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  ImagePicker imagePicker = ImagePicker();
  XFile? image;

  Future<void> pickImageFromgallery() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      emit(ProfileSuccess());
    }
  }

  Future<void> pickImageFromCamera() async {
    image = await imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      emit(ProfileSuccess());
    }
  }
}
