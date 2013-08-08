void scrape() {
  // scrape for the strips
  loadPixels();
  if (testObserver.hasStrips) {
    registry.startPushing();
    List<Strip> strips = registry.getStrips();
    int yscale = height / pMap.numStrips;

    for (int stripy = 0; stripy < pMap.numStrips; stripy++) {
      int stripLength = pMap.stripLengths[stripy];
      int xscale = width / stripLength;
      for (int stripx = 0; stripx < stripLength; stripx++) {
        color c = pixels[(stripx*xscale) + (stripy*yscale*width)];
        Pixel p = new Pixel((byte)red(c), (byte)green(c), (byte)blue(c));
        int[][] pList = pMap.pixels(stripy, stripx);
        for (int i = 0; i < pList.length; i++) {
          Strip pStrip = strips.get(pList[i][0]);
          pStrip.setPixel(c, pList[i][1]);
        }
      }
    }
  }
  updatePixels();
}
