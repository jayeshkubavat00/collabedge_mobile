class FeedModel {
  final Profile profile;
  final String title;
  final String description;
  final List<String> techStack;
  final String developmentStatus;
  final List<Profile> teamMembers;
  final bool isInvestorInterested;

  FeedModel({
    required this.profile,
    required this.title,
    required this.description,
    required this.techStack,
    required this.developmentStatus,
    required this.teamMembers,
    this.isInvestorInterested = false,
  });
}

class Profile {
  final String profileId;
  final String profilePhoto;
  final String fullName;
  final String description;

  Profile({
    required this.profileId,
    required this.profilePhoto,
    required this.fullName,
    required this.description,
  });
}
