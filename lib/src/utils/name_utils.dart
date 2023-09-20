String getUserName(String? userName) {
  if (userName == null || userName == '') {
    return 'User';
  }
  final userTitlePre = userName.split(' ')[0].substring(0, 1);
  final userTitlePost = userName.split(' ')[0].substring(1).toLowerCase();

  return '$userTitlePre$userTitlePost';
}
