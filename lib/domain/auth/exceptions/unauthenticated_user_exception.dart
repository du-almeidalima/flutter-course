class UnauthenticatedUserException extends Error {
  final String code;

  UnauthenticatedUserException(this.code);
}