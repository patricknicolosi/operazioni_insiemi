void main() {
  List<List<int>> famiglia = [
    [1, 2, 3],
    [1, 2],
    [1, 3],
    [2, 4],
  ];

  List<List<int>> chiusura = [];
  chiusura.addAll(famiglia); //La chiusura deve contenere la famiglia

  //Aggiungo elementi alla famiglia fino a quando non si "stabilizza" formando cosi la chiusura rispetto l'operazione unione
  for (int i = 0; i < famiglia.length; i++) {
    for (int j = i + 1; j < famiglia.length; j++) {
      chiusura.add(unione(famiglia[i], famiglia[j]));
    }
  }

  //La chiusura è per definizione la più piccola famiglia quindi ripulisco la mia chiusura togliendone i duplicati
  eliminaDuplicati(chiusura);

  print(chiusura);
}

List<int> unione(List<int> a, List<int> b) {
  List<int> c = [];
  c = a + b;
  c.sort();
  return c.toSet().toList();
}

void eliminaDuplicati(List<List<int>> array) {
  for (int i = 0; i < array.length; i++) {
    for (int j = i + 1; j < array.length; j++) {
      if (array[i].toString() == array[j].toString()) {
        array.removeAt(i);
      }
    }
  }
}