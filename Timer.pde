import java.util.Observable;
import java.util.Observer; 

class Timer {
  int counter; //Counter limit
  int limit; //Counter
  boolean done;
  
  Timer(int _limit) {
    counter = 0; //set counter
    limit = _limit; //set limit
    
    done = false;
  }
  
  void advance() {
    counter++;
    if (counter > limit) done = true;
  }
  
  boolean check() {
    return done;
  }
  
//  void destroy() {
//    myTimer.remove(this);
//  }
}
