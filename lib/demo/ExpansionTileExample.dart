import 'package:flutter/material.dart';

class ExpansionTileSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ExpansionTile"),
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            new EntryItem(data[index]),
        itemCount: data.length,
      ),
    );
  }
}

class EntryItem extends StatelessWidget {
  final Entry entry;

  const EntryItem(this.entry);

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return new ListTile(
        title: new Text(root.title),
      );
    }
    return new ExpansionTile(
      title: new Text(root.title),
      key: new PageStorageKey<Entry>(root),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class Entry {
  final String title;
  final List<Entry> children;

  Entry(this.title, [this.children = const <Entry>[]]);
}

final List<Entry> data = <Entry>[
  new Entry("Chapter A", <Entry>[
    new Entry("Section A0", <Entry>[
      new Entry("item A0.1"),
      new Entry("item A0.2"),
      new Entry("item A0.3"),
    ]),
    new Entry('Section A1'),
    new Entry('Section A2'),
  ]),
  new Entry("Chapter B", <Entry>[
    new Entry("Section B0"),
    new Entry("Section B1"),
  ]),
  new Entry("Chapter C", <Entry>[
    new Entry("Section C0"),
    new Entry("Section C1"),
    new Entry("Section C2", <Entry>[
      new Entry("Item C2.0"),
      new Entry("Item C2.1"),
      new Entry("Item C2.2"),
      new Entry("Item C2.3", <Entry>[
        new Entry("Item C2.1.0"),
      ]),
    ]),
  ]),
];
