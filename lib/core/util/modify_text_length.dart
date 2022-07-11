/// Method to modify the length of the text to show them into a widget.
///
/// If we have a text widget how overflow is widget width,
String subStringTextLength(int maxLength, String text, {String ellipsis = '...'}) {
  if (text.length > maxLength) {
    return '${text.substring(0, maxLength - ellipsis.length)}$ellipsis';
  }
  return text;
}
