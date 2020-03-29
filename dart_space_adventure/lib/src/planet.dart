class Planet {
  final String name;
  final String description;

  Planet({this.name = 'Plan It', this.description = 'The default planet but don\'t plan on it.'});

  Planet.nullPlanet() : name = 'Null', description = 'Null';
}