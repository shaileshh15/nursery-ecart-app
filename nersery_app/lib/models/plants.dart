class Plant {
  final String plantId;
  final String plantName;
  final String category;
  final String imageURL;
  final double price;
  final String description;

  Plant({
    required this.plantId,
    required this.plantName,
    required this.category,
    required this.imageURL,
    required this.price,
    required this.description,
  });

  static List<Plant> plantList = [
    // Existing plants
    Plant(
      plantId: '1',
      plantName: 'Aloe Vera',
      category: 'Indoor',
      imageURL: 'assets/images/aloe vera.webp',
      price: 9.99,
      description:
          'Aloe Vera is an easy-to-care-for plant that helps purify air and is great for skincare.',
    ),

    // New plants replacing "Snake Plant" and "Money Plant"
    Plant(
      plantId: '2',
      plantName: 'Mango',
      category: 'Outdoor',
      imageURL: 'assets/images/mango.webp', // Add your image path here
      price: 19.99,
      description:
          'Mango is a tropical fruit-bearing tree that thrives in sunny, warm climates and produces sweet fruit.',
    ),

    Plant(
      plantId: '3',
      plantName: 'Pineapple',
      category: 'Outdoor',
      imageURL: 'assets/images/pineapple.jpg', // Add your image path here
      price: 15.99,
      description:
          'Pineapple is a tropical plant that produces large, sweet fruit with a unique taste and texture.',
    ),

    Plant(
      plantId: '4',
      plantName: 'Rose Plant',
      category: 'Garden',
      imageURL: 'assets/images/rose.webp',
      price: 15.99,
      description:
          'A beautiful flowering plant that enhances your garden with vibrant colors and fragrance.',
    ),

    // New Supplement Plants
    Plant(
      plantId: '5',
      plantName: 'Ginseng',
      category: 'Supplement',
      imageURL: 'assets/images/ginseng.webp', // Add your image path here
      price: 19.99,
      description:
          'Ginseng is known for its medicinal properties, including boosting energy levels and improving cognitive function.',
    ),
    Plant(
      plantId: '6',
      plantName: 'Turmeric',
      category: 'Supplement',
      imageURL: 'assets/images/turmeric.jpg', // Add your image path here
      price: 10.99,
      description:
          'Turmeric is a powerful anti-inflammatory plant, used in both cooking and medicine to support joint health and overall wellness.',
    ),
    Plant(
      plantId: '7',
      plantName: 'Peppermint',
      category: 'Supplement',
      imageURL: 'assets/images/peppermint.jpg', // Add your image path here
      price: 8.99,
      description:
          'Peppermint is great for digestion and can be used as an herbal remedy for headaches and stomach issues.',
    ),
    Plant(
      plantId: '8',
      plantName: 'Lavender',
      category: 'Supplement',
      imageURL: 'assets/images/lavender.jpg', // Add your image path here
      price: 14.99,
      description:
          'Lavender has relaxing properties, often used in aromatherapy to reduce stress and improve sleep quality.',
    ),
    Plant(
      plantId: '9',
      plantName: 'Echinacea',
      category: 'Supplement',
      imageURL: 'assets/images/echina.jpg', 
      price: 13.99,
      description:
          'Echinacea is commonly used to boost the immune system and help prevent colds and infections.',
    ),
    Plant(
      plantId: '10',
      plantName: 'Ginger',
      category: 'Supplement',
      imageURL: 'assets/images/ginger.jpg', // Add your image path here
      price: 9.49,
      description:
          'Ginger is an antioxidant-rich plant known for its ability to alleviate nausea and promote digestive health.',
    ),

    Plant(
      plantId: '11',
      plantName: 'Tulip',
      category: 'Garden',
      imageURL: 'assets/images/tulip.jpg', // Add your image path here
      price: 12.99,
      description:
          'Tulips are vibrant spring flowers that come in many colors and are perfect for garden beds and borders.',
    ),
    Plant(
      plantId: '12',
      plantName: 'Sunflower',
      category: 'Garden',
      imageURL: 'assets/images/sunflower.webp',
      price: 9.49,
      description:
          'Sunflowers are cheerful, tall plants known for their large, yellow blooms that attract pollinators.',
    ),
    Plant(
      plantId: '13',
      plantName: 'Hydrangea',
      category: 'Garden',
      imageURL: 'assets/images/Hydrangea.webp', // Add your image path here
      price: 20.99,
      description:
          'Hydrangeas are gorgeous flowering shrubs that bloom in large clusters of vibrant colors.',
    ),

    Plant(
      plantId: '14',
      plantName: 'Spider Plant',
      category: 'Indoor',
      imageURL: 'assets/images/spider.webp', // Add your image path here
      price: 12.99,
      description:
          'Spider plants are low-maintenance, air-purifying plants that thrive indoors and produce small white flowers.',
    ),
    Plant(
      plantId: '15',
      plantName: 'Peace Lily',
      category: 'Indoor',
      imageURL: 'assets/images/peace_lily.jpg', // Add your image path here
      price: 14.49,
      description:
          'Peace Lilies are easy to care for, known for their beautiful white flowers and ability to purify the air.',
    ),
    Plant(
      plantId: '16',
      plantName: 'Fiddle Leaf Fig',
      category: 'Indoor',
      imageURL: 'assets/images/fiddle_leaf_fig.jpg', // Add your image path here
      price: 29.99,
      description:
          'Fiddle Leaf Figs are trendy indoor plants known for their large, glossy leaves, adding a tropical touch to any room.',
    ),

    Plant(
      plantId: '17',
      plantName: 'Cucumber',
      category: 'Outdoor',
      imageURL: 'assets/images/cucumber.jpg', // Add your image path here
      price: 6.99,
      description:
          'Cucumbers are refreshing vegetables that grow on vines and thrive in full sunlight. Great for home gardens.',
    ),
    Plant(
      plantId: '18',
      plantName: 'Tomato',
      category: 'Outdoor',
      imageURL: 'assets/images/tomato.jpg', // Add your image path here
      price: 7.99,
      description:
          'Tomatoes are delicious, versatile fruits that grow well in sunny outdoor environments. Perfect for gardens and patios.',
    ),
  ];
}
