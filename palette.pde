PImage foto[];
Table table;
int num = 40;

void settings() {

  size(500, 500);
}

void setup() {
  foto = new PImage[num];
  table = loadTable("photos.csv", "header");
  for (TableRow row : table.rows()) {

    int id = row.getInt("id");
    String name = row.getString("name");

    foto[id] = loadImage(name);
  }
}

void draw() {
    for (int k = 0; k < num; k++) {
      println(k);
      color[] mypixels;
      int Npixel = foto[k].width*foto[k].height;
      mypixels = new color [Npixel];

      int counter = 0;

      for (int i = 0; i<foto[k].width; i++) {
        for (int j = 0; j<foto[k].height; j++) {
          mypixels[counter] = foto[k].get(i, j);
          counter++;
        }
      }

      color [] newpix = sortMPixels(mypixels);
      counter = 0;

      for (int i = 0; i<foto[k].width; i++) {
        for (int j = 0; j<foto[k].height; j++) {
          foto[k].set(i, j, newpix[counter]);
          counter++;
        }
      }

      image(foto[k], 0, 0);
      delay(50);
      rec();
    }
}
