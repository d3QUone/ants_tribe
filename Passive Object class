class PO
{
  float xp, yp;           // coordinate of field
  int id, nb;             // identification number, number of blocks
  int xn, yn;             // number of blocks in 'x' and in 'y'

  color tex = #8CA046;    // texture

  int fquant = 10;        // quantity of food at t = 0 

  PO(int x, int y, int konf, int idn)
  {
    xp = s*(0.5 + x); 
    yp = s*(0.5 + y);

    if ( konf == 1)
    {
      xn = 3;
      yn = 1;
    }
    else if ( konf == 2)
    {
      xn = 1;
      yn = 3;
    }

    id = idn;
  }


  void update()
  {
    if ((mouseX > xp) && (mouseX < xp + s*xn) && (mouseY > yp) && (mouseY < yp + s*yn))
    {
      fill(font);
      rect(xp - 0.125*s, yp - 0.125*s, s*(0.25 + xn), s*(0.25 + yn));

      fill(tex); // field color
      rect(xp, yp, s*xn, s*yn);
      
      infoboard();
    }
    else
    {
      fill(tex); // field color
      rect(xp, yp, s*xn, s*yn);
    }
  }

  void infoboard()
  {
    fill(font);           
    textSize(0.4*s);      
    text(id + ";" + fquant, xp + 0.2*s, yp + 0.63*s);  // only ID now
  }
}
