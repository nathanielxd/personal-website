import 'package:personal_website/entities/item.dart';

class Data {

  static int theme = 0;

  static const personalDescription =
    'Enthusiastic developer with strong experience in the mobile development ecosystem, project architecture and app design. '
    'As a young developer, I put passion into my work and deliver quality products. '
    'With 3 apps and 2 libraries published online, previous experience in networking, algorithms and programming, '
    'implementing your awesome business idea is no hard task.';
  
  static const contactDescription =
    'For any business inquiries, please e-mail me at me@nathans.dev first.';

  static const resumeLink = 'https://firebasestorage.googleapis.com/v0/b/nathaniel-dev.appspot.com/o/resume.pdf?alt=media&token=c306a951-bc68-4238-b7ff-1f67000a5c94';

  static const List<Item> projects = [
    Item(
      id: 'tapline',
      name: 'Tapline',
      asset: 'tapline.png',
      options: [
        ItemOption(
          title: 'Website',
          asset: 'launch.png',
          link: 'https://tapline.nathans.dev'
        ),
        ItemOption(
          title: 'Google Play',
          asset: 'googleplay.png',
          link: 'https://play.google.com/store/apps/details?id=com.nathanielxd.tapline'
        )
      ]
    ),
    Item(
      id: 'lanchat',
      name: 'Simple LAN Chat',
      asset: 'lanchat.jpg',
      options: [
        ItemOption(
          title: 'Google Play',
          asset: 'googleplay.png',
          link: 'https://play.google.com/store/apps/details?id=com.nathanielxd.SimpleLANChat'
        ),
        ItemOption(
          title: 'Github',
          asset: 'github.png',
          link: 'https://github.com/nathanielxd/simple-lan-chat'
        )
      ]
    ),
    Item(
      id: 'magichome',
      name: 'MagicHome.NET',
      asset: 'magichome.jpg',
      options: [
        ItemOption(
          title: 'Github',
          asset: 'github.png',
          link: 'https://github.com/nathanielxd/magic-home'
        )
      ]
    ),
    Item(
      id: 'vocabulary',
      name: 'Lightweight Vocabulary',
      asset: 'vocabulary.jpg',
      options: [
        ItemOption(
          title: 'Google Play',
          asset: 'googleplay.png',
          link: 'https://play.google.com/store/apps/details?id=com.nathanielxd.lightweightvocabulary'
        )
      ]
    )
  ];
}