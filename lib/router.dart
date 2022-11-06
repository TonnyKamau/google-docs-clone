import 'package:flutter/material.dart';
import 'package:google_docs_clone/screens/documents.dart';
import 'package:google_docs_clone/screens/homescreen.dart';
import 'package:google_docs_clone/screens/login.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (route) => const MaterialPage(child: Login()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (route) => const MaterialPage(child: HomeScreen()),
  '/document/:id':(route) => MaterialPage(child: Document(id: route.pathParameters['id'] ?? '',)),
});