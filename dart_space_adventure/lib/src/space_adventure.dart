import 'dart:io';
import 'planet.dart';
import 'planetary_system.dart';

class SpaceAdventure {

  final PlanetarySystem planetarySystem;

  SpaceAdventure({this.planetarySystem});

  void start() {
    printGreeting();
    printIntroduction(responseToPrompt('What is your name?'));
    print('Let\'s go on an adventure!');
    if (planetarySystem.hasPlanets) {
      travel(
        promptForRandomOrSpecificDestination(
          'Shall I randomly choose a planet for you to visit? (Y or N)'
        )
      );
    } else {
      print('Aw, there are no planets to explore.');
    }
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}!');
    print('There are ${planetarySystem.numberOfPlanets} planets to explore.');
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
    Planet planet;
    if (randomDestination) {
      planet = planetarySystem.getRandomPlanet();
    } else {
      planet = getPlanetFromUser();
    }
    travelTo(planet);
  }

  Planet getPlanetFromUser() {
    String input = responseToPrompt('Name the planet you would like to visit.');
    while (true) {
      Planet realPlanet = planetarySystem.getPlanetWithName(input);
      if(realPlanet != null) {
        return realPlanet;
      }
      input = responseToPrompt('Sorry friend! I didn\'t catch that. Pick one of the following planets: ${planetarySystem.getPlanetsString()}.');
    }
  }

  void travelTo(Planet destination) {
    print(
      'Traveling to ${destination.name}...\n'
      'Arrived at ${destination.name}. ${destination.description}'
    );
  }
}