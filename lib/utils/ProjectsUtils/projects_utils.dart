import 'package:easy_localization/easy_localization.dart';

class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}

// ###############
// HOBBY PROJECTS
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/agepet.png',
    title: 'projecttitle4'.tr(),
    subtitle: 'projectsubtitle4'.tr(),
    androidLink: '',
  ),
  ProjectUtils(
    image: 'assets/projects/gasoline.png',
    title: 'projecttitle1'.tr(),
    subtitle: 'projectsubtitle1'.tr(),
    androidLink: '',
    iosLink: "",
  ),
  ProjectUtils(
      image: 'assets/projects/groceryapp.png',
      title: 'projecttitle3'.tr(),
      subtitle: 'projectsubtitle3'.tr(),
      androidLink: '',
      iosLink: ''),
  ProjectUtils(
    image: 'assets/projects/portfolio.png',
    title: 'projecttitle5'.tr(),
    subtitle: 'projectsubtitle5'.tr(),
    webLink: '',
  ),
  ProjectUtils(
    image: '',
    title: '',
    subtitle: '',
    androidLink: '',
  ),
  ProjectUtils(
    image: '',
    title: '',
    subtitle: '',
    androidLink: '',
    iosLink: '',
  ),
];

// ###############
// WORK PROJECTS
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/lawfirm.png',
    title: 'projecttitle2'.tr(),
    subtitle: 'projectsubtitle2'.tr(),
    webLink: '',
  ),
  ProjectUtils(
    image: '',
    title: '',
    subtitle: '',
    webLink: '',
  ),
  ProjectUtils(
    image: '',
    title: '',
    subtitle: '',
    webLink: '',
  ),
];
