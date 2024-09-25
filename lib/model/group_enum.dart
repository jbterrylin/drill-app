enum GroupInviteStatus {
  none(0),
  pending(1),
  approve(2),
  reject(3);

  // 这是用于保存枚举的数值
  final int value;
  const GroupInviteStatus(this.value);

  // 根据数值获取对应的枚举值
  static GroupInviteStatus fromValue(int value) {
    return GroupInviteStatus.values.firstWhere((status) => status.value == value,
        orElse: () => GroupInviteStatus.none);
  }
}