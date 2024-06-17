import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/sizes.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  final List<int> _items = [];

  final Duration _duration = const Duration(milliseconds: 300);

  void _addItem() {
    final currentState = _key.currentState;
    if (currentState == null) {
      return;
    }

    currentState.insertItem(
      _items.length,
      duration: _duration,
    );
    _items.add(_items.length);
  }

  void _deleteItem(int index) {
    final currentState = _key.currentState;
    if (currentState == null) {
      return;
    }

    currentState.removeItem(
      index,
      (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: Container(
          color: Colors.red,
          child: _makeTitle(index),
        ),
      ),
      duration: _duration,
    );
    _items.remove(index);
  }

  Widget _makeTitle(int index) {
    return ListTile(
      onLongPress: () => _deleteItem(index),
      leading: const CircleAvatar(
        radius: 30,
        foregroundImage: NetworkImage(
          "https://avatars.githubusercontent.com/u/3612017",
        ),
        child: Text('니꼬'),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Lynn ($index)",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            "2:16 PM",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: Sizes.size12,
            ),
          ),
        ],
      ),
      subtitle: const Text("Don't forget to make video"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text("Direct Messages"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          ),
        ],
      ),
      body: AnimatedList(
        key: _key,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            key: UniqueKey(),
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              child: _makeTitle(index),
            ),
          );
        },
      ),
    );
  }
}
