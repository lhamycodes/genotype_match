extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String unslug() {
    return "${this.replaceAll("_", " ")}";
  }

  String uppercaseFirst() {
    List arrStr = this.split(" ");
    String formatted = "";
    for (var part in arrStr) {
      formatted += part.toString().capitalize() + " ";
    }
    return formatted.trim();
  }

  bool isNullOrEmpty() {
    if (this == null || this.toString() == "" || this.isEmpty) {
      return true;
    }
    return false;
  }

  bool isNumeric() {
    if (this == null) {
      return false;
    }
    return double.tryParse(this) != null;
  }
}
