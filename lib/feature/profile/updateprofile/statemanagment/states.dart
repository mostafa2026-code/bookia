class EditProfileSTates{}

class EditProfileInitial extends EditProfileSTates{}

class EditProfileLoading extends EditProfileSTates{}

class EditProfileError extends EditProfileSTates{
  final String error;
  EditProfileError({required this.error});
} 

class EditProfileSuccess extends EditProfileSTates{}
