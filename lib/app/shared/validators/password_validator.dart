String passwordValidator(String password) {
  if (password.isEmpty || password.length < 6) {
    return 'Password must be at least 6 characters long';
  }

  return null;
}