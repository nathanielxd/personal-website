class ItemOption {
  final String title;
  final String asset;
  final String link;

  const ItemOption({this.title, this.asset, this.link});
}

class Item {
  final String id;
  final String name;
  final String asset;
  final List<ItemOption> options;

  const Item({this.id, this.name, this.asset, this.options});
}