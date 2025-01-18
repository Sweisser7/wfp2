
class StampCard {
  int _stamps = 0; // Private Variable für die Anzahl der Stempel

  // Funktion, um den aktuellen Stempelwert zurückzugeben
  int get stamps => _stamps;

  // Funktion, um Stempel hinzuzufügen
  void addStamp() {
    _stamps++;
    print('Ein Stempel wurde hinzugefügt. Aktuelle Anzahl: $_stamps');
  }

  // Beispiel-Funktion, die bei Erfolg einen Stempel hinzufügt
  void performTask(String message) {
    if (message != "NFC session completed successfully!") {
      print('Aufgabe erfolgreich abgeschlossen!');
      addStamp();
    } else {
      print('Aufgabe fehlgeschlagen. Kein Stempel hinzugefügt.');
    }
  }

  int showStampCount() {
  // Neues Stempelkartensystem erstellen
  StampCard stampCard = StampCard();
  return stampCard._stamps;
  }
}


