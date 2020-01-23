import 'dart:convert';
import 'dart:io';
import 'planetary_system.dart';
import 'planet.dart';

class ReadFile {
  String filename;

  ReadFile({this.filename = 'package.json'});

  PlanetarySystem getPlanetarySystem() {
    return parseJson(jsonDecode(readFile(filename)));
  }

  PlanetarySystem parseJson(Map jsonData) {
    return PlanetarySystem(name: jsonData['name'], planets: getPlanets(jsonData['planets']));
  }

  List<Planet> getPlanets(List planetsData) {
    List<Planet> planets = new List();
    for (final planetData in planetsData) {
      planets.add(Planet(name: planetData['name'], description: planetData['description']));
    }
    return planets;
  }

  String readFile(String path) {
    return File(path).readAsStringSync();
  }
}