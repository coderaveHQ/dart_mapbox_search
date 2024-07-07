// Extension on nullable types to provide additional functionality
extension GenericExtension<T> on T? {
  // Method that executes a function if the value is not null
  K? whenNotNull<K>(K Function(T value) function) {
    // If the value is null, return null
    if (this == null) return null;
    // If the value is not null, execute the function with the value and return the result
    return function.call(this as T);
  }
}
