import 'package:flutter/material.dart';
import 'package:organizador/app.dart';
import 'package:organizador/providers/list_item_provider.dart';
import 'package:organizador/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ListItemProvider()),
      ],
      child: const MeuAplicativo(),
    )
  );
}