part of 'landing_cubit.dart';

class LandingState extends Equatable {

  final bool isDesktop;
  final String resumeLink;
  final String githubLink;
  final String email;
  final String description;

  LandingState({
    required this.isDesktop,
    this.resumeLink = 'https://firebasestorage.googleapis.com/v0/b/nathaniel-dev.appspot.com/o/NathanielDragusinResume.pdf?alt=media&token=1bb9234f-4186-4baf-ba62-73037ac59be5',
    this.githubLink = 'https://github.com/nathanielxd/',
    this.email = 'me@nathans.dev',
    this.description = 'Flutter | Mobile | Web Developer',
  });

  @override
  List<Object> get props => [isDesktop, resumeLink, githubLink, email, description];
}
