class UserProfileModel {
  final String? name;
  final String? avatarUrl;
  final String? description;
  final String email;
  final int likesCount;
  final int subscribersCount;
  final int publicationsCount;
  final bool isVerificated;

  UserProfileModel({
    this.name,
    this.avatarUrl,
    this.description,
    required this.email,
    required this.likesCount,
    required this.subscribersCount,
    required this.publicationsCount,
    required this.isVerificated,
  });
}
