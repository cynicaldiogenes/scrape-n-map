import com.heroicrobot.dropbit.devices.*;
import com.heroicrobot.dropbit.common.*;
import com.heroicrobot.dropbit.discovery.*;
import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.*;
import java.util.*;
TestObserver testObserver;
DeviceRegistry registry;
PixelMap pMap;

class TestObserver implements Observer {
  public boolean hasStrips = false;
  public void update(Observable registry, Object updatedDevice) {
        println("Registry changed!");
        if (updatedDevice != null) {
          println("Device change: " + updatedDevice);
        }
        this.hasStrips = true;
    }
};

float x,y;
int i,b=256;

void setup(){
  size(b,b);
  colorMode(3);
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  pMap = new PixelMap();
}
  
void draw(){
  for(i=0;i++<b*b;){
    x=i%b-b/2;
    y=i/b-b/2;
    set(i%b,i/b,color((b*(atan2(y,x)/PI-log(dist(0,0,x,y)))+millis()/4)%b,b,b));
  }
  scrape(); 
}