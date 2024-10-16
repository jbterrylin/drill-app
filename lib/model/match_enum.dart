enum EnumGameTeamResultResult {
  win(1),
  lose(2);

  final int value;
  const EnumGameTeamResultResult(this.value);

  static EnumGameTeamResultResult? fromValue(int value) {
    try {
      return EnumGameTeamResultResult.values
          .firstWhere((v) => v.value == value);
    } catch (e) {
      return null;
    }
  }
}

enum EnumTeamInviteStatus {
  pending(1),
  accept(2),
  reject(3);

  final int value;
  const EnumTeamInviteStatus(this.value);

  static EnumTeamInviteStatus? fromValue(int value) {
    try {
      return EnumTeamInviteStatus.values.firstWhere((v) => v.value == value);
    } catch (e) {
      return null;
    }
  }
}
