/*
void group(int i, float th) 
 {
 // func 'resulting' parametrs of AO and AOs around him
 // so it (func) chooses the most comfortable group and
 // so AO changes his color, gets to his behavior (color) group
 
 }
 */


// remake it
void friends()    // just a visualisation; AOs "dont understand" it
{
  for (int i = 0; i < num; i ++)
    for (int j = i + i; j < num; j ++)
      if ( abs(trb[i].frnd - trb[j].frnd) <= 0.5) 
        if ((abs(trb[i].xp - trb[j].xp) <= 3*s)&&(abs(trb[i].yp - trb[j].yp) <= 3*s)) 
        {
          stroke(#9614FA);
          strokeWeight(2); 
          line(trb[i].xp, trb[i].yp, trb[j].xp, trb[j].yp);
          noStroke();
        }
}
