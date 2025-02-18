class EntryFood {
  final String name;
  final String unit;
  final double quantity;
  final DateTime created;
  final int foodId;
  final int entryId;
  final Map<String, double> metrics;
  final String? imageFile;
  final String? smallImage;

  EntryFood({
    required this.name,
    required this.foodId,
    required this.entryId,
    required this.quantity,
    required this.unit,
    required this.created,
    required this.metrics,
    required this.imageFile,
    required this.smallImage,
  });
}
