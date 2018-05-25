/**
 * This sketch was based on
 * an example from Processing:
 * Loading Tabular Data
 * by Daniel Shiffman.
 */

import processing.pdf.*;

Table table;
int scale = 20;
float proportion = 1.244;

Bubble[] bubbles;

void settings() {
  size(360*scale, int(180*scale*proportion));
}

void setup() {
  background(0);
  noStroke();
  blendMode(ADD);
  loadData();
}

void draw() {
  background(0);

  for (Bubble b : bubbles) {
    b.display();
  }

  String fileName = "saved-png/" + year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + "-planets.png";
  saveFrame(fileName);
  exit();
}

void loadData() {
  table = loadTable("planets.csv", "header");

  // The size of the array of Bubble objects is determined by the total number of rows in the CSV
  bubbles = new Bubble[table.getRowCount()]; 

  int rowCount = 0;
  for (TableRow row : table.rows()) {
    float st_glon = row.getFloat("st_glon") * scale; // Galactic Longitude [deg]
    float st_glat = (row.getFloat("st_glat") + 90) * scale; // Galactic Latitude [deg]

    /*
     * Comment/uncomment each of the following
     * pairs of lines to change the radius parameter
    */

    int pl_orbper = constrain(row.getInt("pl_orbper"), 0, 300); // Orbital Period [days]
    float radius = log(pl_orbper) * 100;

    //float pl_masse = row.getFloat("pl_masse"); // Planet Mass (Earth mass)
    //float radius = pl_masse/5;
    
    //float pl_rade = row.getFloat("pl_rade"); // Planet Radius (Earth radii) 
    //float radius = pl_rade * 30;

    bubbles[rowCount] = new Bubble(st_glon, st_glat * proportion, radius, "name");
    rowCount++;
  }
}
