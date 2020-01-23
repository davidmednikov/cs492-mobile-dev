import 'dart:io';
import 'dart:math';
import 'planet.dart';
import 'planetary_system.dart';

class SpaceAdventure {

  PlanetarySystem planetarySystem;

  SpaceAdventure({this.planetarySystem});

  void start() {
    printGreeting();
    printIntroduction(responseToPrompt('What is your name?'));
    print('Let\'s go on an adventure!');
    travel(
      promptForRandomOrSpecificDestination(
        'Shall I randomly choose a planet for you to visit? (Y or N)'
      )
    );
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}!');
    print('There are ${planetarySystem.planets.length} planets to explore.');
  }

  String responseToPrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync();
  }

  void printIntroduction(String name) {
    print('Nice to meet you, $name. My name is Eliza. I\'m an old friend of Alexa.');
  }

  bool promptForRandomOrSpecificDestination(String prompt) {
    String answer;
    while (answer != 'Y' && answer != 'N') {
      answer = responseToPrompt(prompt);
      if (answer == 'Y') {
        return true;
      } else if (answer == 'N') {
        return false;
      } else {
        print('Sorry, I didn\'t get that.');
      }
    }
    return false;
  }

  void travel(bool randomDestination) {
    if (randomDestination) {
      travelToRandomDestination();
    } else {
      travelTo(getPlanetFromUser());
    }
  }

  Planet getPlanetFromUser() {
    String input = responseToPrompt('Name the planet you would like to visit.');
    while (true) {
      if(planetarySystem.isRealPlanet(input)) {
        return planetarySystem.planets[planetarySystem.getPlanetIndexByName(input)];
      }
      input = responseToPrompt('Sorry friend! I didn\'t catch that. Pick one of the following planets: ${planetarySystem.getPlanetsString()}.');
    }
  }

  int getRandomNumber(int upTo) {
    return Random().nextInt(upTo);
  }

  void travelToRandomDestination() {
    Planet randomPlanet = planetarySystem.planets[getRandomNumber(planetarySystem.planets.length)];
    print(
      'Ok! Traveling to ${randomPlanet.name}...\n'
      'Arrived at ${randomPlanet.name}. ${randomPlanet.description}'
    );
  }

  void travelTo(Planet destination) {
    print(
      'Traveling to ${destination.name}...\n'
      'Arrived at ${destination.name}. ${destination.description}'
    );
  }
}