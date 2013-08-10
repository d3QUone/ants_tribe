// primitive block, that makes food-zones
// (put's Passive Objects)
//
// 11 june, d3QUone

void makefields()
{
  // i've spent 2 dayz on a intelectual func, failed and made this. lol.
  ff[0] = new PO(1, 3, 2, 0);
  ff[1] = new PO(3, 1, 1, 1);
  ff[2] = new PO(3, 6, 1, 2);
  ff[3] = new PO(9, 1, 1, 3);
  ff[4] = new PO(9, 6, 1, 4);
  ff[5] = new PO(13, 3, 2, 5);
}




// ants are living only in this frame (it's only a visualisation of control_pos-func)
// also, stat-block is out of frame
//
// 8 june, d3QUone

void frame()
{
  stroke(#9614FA);
  strokeWeight(3);   
  line(s/2-2, s/2-2, width - s/2+2, s/2-2);
  line(s/2-2, height - s/2+2, width - s/2+2, height - s/2+2);
  line(s/2-2, s/2-2, s/2-2, height - s/2+2);
  line(width - s/2+2, s/2-2, width - s/2+2, height - s/2+2);  
  noStroke();

  if ((mouseX > width - s/2 + 3) && (mouseX < width - 3) && (mouseY > 3) && (mouseY < s/2 - 3))
  {
    fill(font);
    rect(width - s/2, 0, s/2, s/2);

    fill(#9614FA);
    rect(width - s/2 + 3, 3, s/2 - 6, s/2 - 6);

    fill(font);
    textSize(0.4*s);
    text("numb now: " + num, width - 3.9*s, 0.8*s);
    text("time of simul: " + year, width - 3.9*s, 1.3*s);
  }
  else 
  {
    fill(#9614FA);
    rect(width - s/2 + 3, 3, s/2 - 6, s/2 - 6);
  }
}
