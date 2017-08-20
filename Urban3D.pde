import org.gicentre.geomap.*;
import java.util.TreeMap;

PImage orto;

City3D city;

void setup() {

    //size(1200,800,P3D);
    size(1200,805,P3D);
    //pixelDensity(2);
    
    city = new City3D(this, "gis/buildings_simplified", width, height);
    city.paint(#37383a);
    
    city.update(width/2, height/2, 0, 3);
}


void draw() {
    
    background(#181B1C);

    city.draw();
 
    fill(0);
    text(frameRate, 20, 20);

void mouseClicked() {
    int i = city.pick(mouseX, mouseY);
    //city.highlight(i, #E40205);
    city.highlight(i, #00FF00);
    city.centerAt(i);
}
void keyPressed() {
    switch(key) {
        case '+':
            city.zoom(1);
            break;
        case '-':
            city.zoom(-1);
            break;
        case CODED:
            switch(keyCode) {
                case LEFT:
                    city.move(-10, 0);
                    break;
                case RIGHT:
                    city.move(10, 0);
                    break;
                case UP:
                    city.move(0, -10);
                    break;
                case DOWN:
                    city.move(0, 10);
                    break;
            }
            break;
    }
}