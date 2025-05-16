class Fertilizer {
  final String fertilizerId;
  final String name;
  final String description;
  final double price;
  final String imageURL;
  final String applicationType;

  Fertilizer({
    required this.fertilizerId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageURL,
    required this.applicationType,
  });

  static List<Fertilizer> fertilizerList = [
    Fertilizer(
      fertilizerId: 'f1',
      name: 'Organic Fertilizer',
      description: 'A balanced fertilizer that improves plant growth.',
      price: 12.99,
      imageURL: 'assets/images/organic_fertilizer.jpg',
      applicationType: 'Granules',
    ),
    Fertilizer(
      fertilizerId: 'f2',
      name: 'Hydroponic Fertilizer',
      description: 'Specially designed for hydroponic systems.',
      price: 15.99,
      imageURL: 'assets/images/hydroponic_fertilizer.jpg',
      applicationType: 'Liquid',
    ),
    // Add more fertilizers...
  ];
}

class PlantTool {
  final String toolId;
  final String name;
  final String description;
  final double price;
  final String imageURL;

  PlantTool({
    required this.toolId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageURL,
  });

  static List<PlantTool> plantToolList = [
    PlantTool(
      toolId: 't1',
      name: 'Watering Can',
      description: 'Ideal for watering small to medium plants.',
      price: 9.99,
      imageURL: 'assets/images/watering_can.jpg',
    ),
    PlantTool(
      toolId: 't2',
      name: 'Pruning Shears',
      description: 'For trimming and cutting plants.',
      price: 15.49,
      imageURL: 'assets/images/pruning_shears.jpg',
    ),
    // Add more tools...
  ];
}
