bool isValid(String? text) {
  if (text == null) {
    return false;
  }
  return text.isNotEmpty;
}
