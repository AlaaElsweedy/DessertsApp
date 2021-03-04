class Product {
  final String id;
  final String title;
  final String ingredients;
  final String image;
  final double price;

  Product({
    this.id,
    this.title,
    this.ingredients,
    this.image,
    this.price,
  });
}

final List<Product> products = [
  Product(
    id: 'p1',
    title: 'Chocolate Cake',
    ingredients: ' flour, sugar, eggs, butter or oil or margarine, a liquid, and a leavening agent, such as baking soda or baking powder. Common additional ingredients and flavourings include dried, candied, or fresh fruit, nuts, cocoa, and extracts such as vanilla, with numerous substitutions for the primary ingredients',
    image: 'assets/images/chocolate.png',
    price: 13.99,
  ),
  Product(
    title: 'Strawberry Cake',
    id: 'p2',
    ingredients: ' flour, sugar, eggs, butter or oil or margarine, a liquid, and a leavening agent, such as baking soda or baking powder. Common additional ingredients and flavourings include dried, candied, or fresh fruit, nuts, cocoa, and extracts such as vanilla, with numerous substitutions for the primary ingredients',
    image: 'assets/images/strawberry_cake.png',
    price: 18.50,
  ),
  Product(
    id: 'p3',
    title: 'Cherry and Strawberry Cake',
    ingredients: ' flour, sugar, eggs, butter or oil or margarine, a liquid, and a leavening agent, such as baking soda or baking powder. Common additional ingredients and flavourings include dried, candied, or fresh fruit, nuts, cocoa, and extracts such as vanilla, with numerous substitutions for the primary ingredients',
    image: 'assets/images/cherry_strawberry_cake.png',
    price: 21.99,
  ),
  Product(
    id: 'p4',
    title: 'Oreo Cake',
    ingredients: ' flour, sugar, eggs, butter or oil or margarine, a liquid, and a leavening agent, such as baking soda or baking powder. Common additional ingredients and flavourings include dried, candied, or fresh fruit, nuts, cocoa, and extracts such as vanilla, with numerous substitutions for the primary ingredients',
    image: 'assets/images/oreo.png',
    price: 20.50,
  ),
];
