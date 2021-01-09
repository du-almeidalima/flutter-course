const Map<String, String> _messagesCodes = {
  'UNKNOWN_ERROR': 'A unknown error has happened',
  'ERROR_TOO_MANY_REQUESTS': 'Too many login attempts, please try latter',
  'ERROR_EMAIL_ALREADY_IN_USE': 'This email is already in use',
  'ERROR_INVALID_EMAIL': 'Email format is not correct',
  'ERROR_EMAIL_NOT_FOUND': 'No user were found with those credentials',
  'ERROR_USER_NOT_FOUND': 'No user were found with those credentials',
  'ERROR_INVALID_PASSWORD': 'No user were found with those credentials',
  'USER_DISABLED': 'This account has been disabled'
};

String getMessageFromCode(String code) {
  if (_messagesCodes[code] != null) {
    return _messagesCodes[code];
  }

  print('Unmapped message code: $code');
  return code;
}