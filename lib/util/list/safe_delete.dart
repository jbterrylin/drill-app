void safeDeleteByIndex(List<dynamic> list, int index) {
  if (index >= 0 && index < list.length) {
    list.removeAt(index);
  } else {
    print('Invalid index: $index');
  }
}
