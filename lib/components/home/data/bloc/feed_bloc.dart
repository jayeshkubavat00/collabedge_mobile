import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sample/components/home/data/models/feed_model.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(FeedInitial()) {
    on<FeedLoadEvent>(onLoadFeeds);
  }

  Future<void> onLoadFeeds(FeedLoadEvent event, Emitter<FeedState> emit) async {
    emit(FeedLoadingState());
    await Future.delayed(Duration(seconds: 2));

    final List<FeedModel> feedData = [
      FeedModel(
        profile: Profile(
          profileId: "001",
          profilePhoto: "https://randomuser.me/api/portraits/men/1.jpg",
          fullName: "John Doe", // Example name
          description:
              "Full Stack Developer | AI Enthusiast", // Example description
        ),
        title: "AI Task Manager",
        description: "An AI-powered task management system for productivity.",
        techStack: ["Flutter", "Dart", "Firebase", "TensorFlow"],
        developmentStatus: "In Progress",
        teamMembers: [
          Profile(
            profileId: "002",
            profilePhoto: "https://randomuser.me/api/portraits/women/2.jpg",
            fullName: "Jane Smith",
            description: "Backend Developer | Blockchain Expert",
          ),
        ],
        isInvestorInterested: true,
      ),
      FeedModel(
        profile: Profile(
          profileId: "003",
          profilePhoto: "https://randomuser.me/api/portraits/men/3.jpg",
          fullName: "Alex Johnson", // Example name
          description:
              "Blockchain Developer | Ethereum Specialist", // Example description
        ),
        title: "Blockchain Voting System",
        description: "A secure blockchain-based voting platform.",
        techStack: ["Solidity", "Ethereum", "Node.js"],
        developmentStatus: "Midway Completed",
        teamMembers: [
          Profile(
            profileId: "004",
            profilePhoto: "https://randomuser.me/api/portraits/women/4.jpg",
            fullName: "Mary Davis",
            description: "Frontend Developer | React Enthusiast",
          ),
        ],
        isInvestorInterested: false,
      ),
      FeedModel(
        profile: Profile(
          profileId: "005",
          profilePhoto: "https://randomuser.me/api/portraits/men/5.jpg",
          fullName: "David Lee", // Example name
          description:
              "Mobile App Developer | Flutter Expert", // Example description
        ),
        title: "Health Monitoring App",
        description: "A health tracking app with real-time monitoring.",
        techStack: ["Flutter", "Dart", "Firebase"],
        developmentStatus: "In Development",
        teamMembers: [
          Profile(
            profileId: "006",
            profilePhoto: "https://randomuser.me/api/portraits/women/6.jpg",
            fullName: "Emily White",
            description: "UX/UI Designer | Health Tech Enthusiast",
          ),
        ],
        isInvestorInterested: true,
      ),
      FeedModel(
        profile: Profile(
          profileId: "007",
          profilePhoto: "https://randomuser.me/api/portraits/men/7.jpg",
          fullName: "Michael Scott", // Example name
          description: "Product Manager | SaaS Expert", // Example description
        ),
        title: "Social Media Aggregator",
        description: "A tool to manage multiple social media accounts.",
        techStack: ["React", "Node.js", "MongoDB"],
        developmentStatus: "Completed",
        teamMembers: [
          Profile(
            profileId: "008",
            profilePhoto: "https://randomuser.me/api/portraits/women/8.jpg",
            fullName: "Rachel Green",
            description: "Marketing Expert | Social Media Guru",
          ),
        ],
        isInvestorInterested: false,
      ),
      FeedModel(
        profile: Profile(
          profileId: "009",
          profilePhoto: "https://randomuser.me/api/portraits/men/9.jpg",
          fullName: "Steve Rogers", // Example name
          description:
              "Web Developer | JavaScript Specialist", // Example description
        ),
        title: "E-Learning Platform",
        description: "An interactive platform for online learning.",
        techStack: ["Vue.js", "Laravel", "MySQL"],
        developmentStatus: "In Progress",
        teamMembers: [
          Profile(
            profileId: "010",
            profilePhoto: "https://randomuser.me/api/portraits/women/10.jpg",
            fullName: "Natalie Portman",
            description: "Content Developer | E-Learning Expert",
          ),
        ],
        isInvestorInterested: true,
      ),
      FeedModel(
        profile: Profile(
          profileId: "011",
          profilePhoto: "https://randomuser.me/api/portraits/men/11.jpg",
          fullName: "Bruce Wayne", // Example name
          description: "AI Developer | Data Scientist", // Example description
        ),
        title: "Job Matching AI",
        description: "AI-driven job matching for professionals.",
        techStack: ["Python", "Django", "PostgreSQL"],
        developmentStatus: "Prototype Ready",
        teamMembers: [
          Profile(
            profileId: "012",
            profilePhoto: "https://randomuser.me/api/portraits/women/12.jpg",
            fullName: "Selina Kyle",
            description: "HR Tech Specialist | Recruitment Expert",
          ),
        ],
        isInvestorInterested: false,
      ),
      FeedModel(
        profile: Profile(
          profileId: "013",
          profilePhoto: "https://randomuser.me/api/portraits/men/13.jpg",
          fullName: "Clark Kent", // Example name
          description:
              "Full Stack Developer | Tech Innovator", // Example description
        ),
        title: "Automated Resume Builder",
        description: "A tool that creates AI-generated resumes.",
        techStack: ["Next.js", "Express.js", "MongoDB"],
        developmentStatus: "In Beta",
        teamMembers: [
          Profile(
            profileId: "014",
            profilePhoto: "https://randomuser.me/api/portraits/women/14.jpg",
            fullName: "Lois Lane",
            description: "Resume Consultant | Career Advisor",
          ),
        ],
        isInvestorInterested: true,
      ),
      FeedModel(
        profile: Profile(
          profileId: "015",
          profilePhoto: "https://randomuser.me/api/portraits/men/15.jpg",
          fullName: "Tony Stark", // Example name
          description:
              "IoT Engineer | Smart Home Expert", // Example description
        ),
        title: "Smart Home Automation",
        description: "IoT-based home automation for convenience.",
        techStack: ["Arduino", "Python", "MQTT"],
        developmentStatus: "Completed",
        teamMembers: [
          Profile(
            profileId: "016",
            profilePhoto: "https://randomuser.me/api/portraits/women/16.jpg",
            fullName: "Pepper Potts",
            description: "Operations Manager | IoT Solutions",
          ),
        ],
        isInvestorInterested: false,
      ),
      FeedModel(
        profile: Profile(
          profileId: "017",
          profilePhoto: "https://randomuser.me/api/portraits/men/17.jpg",
          fullName: "Peter Parker", // Example name
          description:
              "Fitness Enthusiast | App Developer", // Example description
        ),
        title: "Fitness App with AI Coach",
        description: "AI-based personal trainer for fitness tracking.",
        techStack: ["Flutter", "Dart", "TensorFlow Lite"],
        developmentStatus: "Prototype Ready",
        teamMembers: [
          Profile(
            profileId: "018",
            profilePhoto: "https://randomuser.me/api/portraits/women/18.jpg",
            fullName: "Mary Jane Watson",
            description: "Personal Trainer | Fitness Expert",
          ),
        ],
        isInvestorInterested: true,
      ),
    ];

    emit(FeedLoadedState(feeds: feedData));
  }
}
