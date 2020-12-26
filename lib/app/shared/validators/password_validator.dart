String passwordValidator(String password) {
  if (password.isEmpty || password.length < 7) {
    return 'Password must be at least 7 characters long';
  }

  return null;
}