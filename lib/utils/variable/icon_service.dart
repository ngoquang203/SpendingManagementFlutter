
class IconService{
  String stringIcon;
  String title;

  IconService(this.stringIcon, this.title);

  get getStringIcon => stringIcon;
  get getTitle => title;

  set setStringIcon(stringIcon) => this.stringIcon = stringIcon;
  set setTitle(title) => this.title = title;

}

