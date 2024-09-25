

enum EnumGroupInviteStatus {
  none(0),
  pending(1),
  approve(2),
  reject(3);

  final int value;
  const EnumGroupInviteStatus(this.value);

  static EnumGroupInviteStatus? fromValue(int value) {
    try {
      return EnumGroupInviteStatus.values
          .firstWhere((v) => v.value == value);
    } catch (e) {
      return null;
    }
  }
}

