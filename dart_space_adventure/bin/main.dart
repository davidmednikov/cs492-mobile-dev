import 'package:dart_space_adventure/dart_space_adventure.dart';

void main(List<String> arguments) {
  PlanetarySystem planetarySystemData = ReadFile(filename: arguments[0]).getPlanetarySystem();
  SpaceAdventure(planetarySystem: planetarySystemData).start();
}
