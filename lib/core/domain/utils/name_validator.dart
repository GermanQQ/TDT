

final RegExp isCorrectName = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");

bool isValidName(String name){
  List fullName = name.split(' ');
  if(fullName.length == 2 && isCorrectName.hasMatch(name)) return true;
  else return false;
}