validate(String value, int max, int min) {
  if (value.isEmpty) {
    return 'cant be empty ';
  }
  if (value.length > max) {
    return 'you Cant enter more than $max letter';
  }
  if (value.length < min) {
    return 'you cant enter less than $min letter';
  }
}
