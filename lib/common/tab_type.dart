enum TabType {
  home(title: "HOME"),
  commingSoon(title: "공개예정"),
  download(title: "다운로드"),
  search(title: "검색"),
  profile(title: "프로필");

  final String title;

  const TabType({required this.title});
}