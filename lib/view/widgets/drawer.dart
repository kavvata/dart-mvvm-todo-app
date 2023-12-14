import 'package:flutter/material.dart';

Drawer geraDrawer(BuildContext context) {
  const Map<String, Widget> registroTelas = {};

  List<Widget> drawerItems = [
    // Header
    // dentro de uma sizedbox para eu poder ajustar o tamanho
    const SizedBox(
      height: 90,
      child: DrawerHeader(
        decoration: BoxDecoration(),
        child: Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
  ];

  registroTelas.forEach((chave, widget) {
    // gera tile para cada tela
    var tile = ListTile(
      title: Text(chave),
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => widget)),
    );

    drawerItems.add(tile);
  });

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: drawerItems,
    ),
  );
}
