class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final List<String> imageUrls; // Daftar gambar
  final String officialWebsiteUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrls, // Perbarui konstruktor
    required this.officialWebsiteUrl,
  });
}
