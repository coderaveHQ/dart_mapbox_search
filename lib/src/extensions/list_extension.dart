// Extension on List to provide additional functionality
extension ListExtension<T> on List<T> {
  // Method to check if the list only contains allowed items
  bool onlyContainsAllowedItems(List<T> allowedItems) {
    // Returns true if all items in the list are contained in the allowedItems list
    return !any((l) => !allowedItems.contains(l));
  }
}
