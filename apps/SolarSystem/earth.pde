public class Earth extends PaperScreen {

    PShape earthModel;

    public void settings() {
        setDrawingSize( (int) boardSize.x, (int)boardSize.y);
        loadMarkerBoard(sketchPath() + "/data/markers/earth/earth.svg",
                        boardSize.x, boardSize.y);
        setDrawAroundPaper();
    }

    public void setup() {
        earthModel = loadShape("sphere2/earth.obj");
    }


  public void drawAroundPaper() {
      pushMatrix();
      goTo(sun);
      pointLight(200, 200, 200, 0, 0, -50);
      popMatrix();

      // set the correct angle and position
      translate(160, 60, 0);
      rotateX(-HALF_PI);
      rotateY( (float) millis() / 20000f);

      // diamètre de la terre : 12 742 kilomètres
      scale(planetScale * 12742f);

      shader(texlightShader);
      earthModel.draw(getGraphics());
      resetShader();
  }
}
