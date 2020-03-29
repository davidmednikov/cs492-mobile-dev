import 'dart:convert';
import 'dart:io';
import 'planet.dart';
import 'planetary_system.dart';

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
    planetsData.forEach((planet) {
      planets.add(Planet(name: planet['name'], description: planet['description']));
    });
    return planets;
  }

  String readFile(String path) {
    return File(path).readAsStringSync();
  }
}