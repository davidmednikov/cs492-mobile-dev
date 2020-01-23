import 'planet.dart';

class PlanetarySystem {
  String name;
  List<Planet> planets;

  PlanetarySystem({this.name = 'Unnamed System', this.planets = const []});

  bool isRealPlanet(String input) {
    for (final planet in planets) {
      if (planet.name == input) {
        return true;
      }
    }
    return false;
  }

  int getPlanetIndexByName(String input) {
    int index = 0;
    for (final planet in planets) {
      if (planet.name == input) {
        return index;
      }
      index++;
    }
    return -1;
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