import 'dart:math';
import 'planet.dart';

class PlanetarySystem {
  final Random _random = Random();
  final String name;
  final List<Planet> planets;

  PlanetarySystem({this.name = 'Unnamed System', this.planets = const []});

  int get numberOfPlanets => planets.length;
  bool get hasPlanets => planets.isNotEmpty;

  Planet getRandomPlanet() {
    if (!hasPlanets) {
      return Planet.nullPlanet();
    }
    return planets[_random.nextInt(planets.length)];
  }

  Planet getPlanetWithName(String input) {
    print(input);
    return planets.firstWhere(
      (planet) => planet.name == input,
      orElse: () => null
    );
  }

  String getPlanetsString() {
    String returnString = '';
    int counter = 0;
    for (final planet in planets) {
      if (counter == 0) {
        returnString = '${planet.name}';
      } else {
        returnString = '$returnString, ${planet.name}';
      }
      counter ++;
    }
    return returnString;
  }
}