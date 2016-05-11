class Timer {
  int sec;
  
  Timer(int _sec) {
    sec = _sec;
  }
  
  void startTimer() {
    sec--;
  }
  
  boolean timerDone() {
    if (sec <= 0) {
      return true;
    }
    return false;
  }
}

