abstract class NutrientUnit {
  final String name;
  final String symbol;

  const NutrientUnit({required this.name, required this.symbol});
}

enum UnitMass implements NutrientUnit{
  gram(name: "gram", symbol: "g"),
  milligram(name: "milligram", symbol: "mg");

  final String name;
  final String symbol;

  const UnitMass({required this.name, required this.symbol});
}

enum UnitEnergy implements NutrientUnit{
  kilocalories(name: "kilocalories", symbol: "kcal"),
  kilojoules(name: "kilojoules", symbol: "kJ");

  final String name;
  final String symbol;

  const UnitEnergy({required this.name, required this.symbol});
}
