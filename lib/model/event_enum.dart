enum EnumEventStatus {
  none(0),
  active(1),
  inactive(2);

  final int value;
  const EnumEventStatus(this.value);

  static EnumEventStatus? fromValue(int value) {
    try {
      return EnumEventStatus.values.firstWhere((v) => v.value == value);
    } catch (e) {
      return null;
    }
  }
}

enum EnumEventUserStatus {
  none(0),
  join(1),
  reject(2);

  final int value;
  const EnumEventUserStatus(this.value);

  static EnumEventUserStatus? fromValue(int value) {
    try {
      return EnumEventUserStatus.values.firstWhere((v) => v.value == value);
    } catch (e) {
      return null;
    }
  }
}
