void build()
{
  int xrow = int(1.34*sqrt(num)+1);  // AOs in every line
  int yrow = int(0.75*sqrt(num)+1);  // AOs in every stolb  

  float x0 = s*(16 - xrow)/2;  
  float y0 = s*(9 - yrow)/2; 

  int i = 0;
  for (int j = 0; j < yrow; j ++)
  {
    if (i == num) break;
    for (int u = 0; u < xrow; u ++)
    {
      if (i == num) break;
      trb[i] = new AO(x0 + 1.25*s*u, y0 + 1.25*s*j + s/2, s, zer, i);
      i = i + 1;
    }
  }
}


//---------------------

int freeID()
{
  int alv = 0;   

  for (int i = 0; i < max; i ++)
    if (trb[i].died == true) vacant[i] = i;
    else {
      vacant[i] = -1;   // it means, AO is still alive
      alv = alv + 1;    // check num's
    }

  num = alv + 1;        // updating number of 'sitizens'

  for (int i = 0; i < max; i ++) if (vacant[i] == -1) vacant = subset(vacant, i, 1);
  return vacant[0];
}


void dochild(int p1, int p2)
{
  // p1 & p2 - ID's of parents
  // we can add a child if there is free place
  if (num < max)
  {
    // 1) get free ID
    int i = freeID();

    // 2) mix abillyties of parrents
    float abl0 = sqrt(trb[p1].abl*trb[p2].abl);
    float sq0 = sqrt(trb[p1].sq*trb[p2].sq);
    float socgr0 = sqrt(trb[p1].socgr*trb[p2].socgr);

    // 3) find free coordinates
    // not made yet

    // 4) make a child
    //trb[i] = new AO( x, y, s, zer, i);

    trb[i].abl = abl0;
    trb[i].sq = sq0;
    trb[i].socgr = socgr0;
  }
}



void con(int i, int j)
{
  float dx = trb[i].xp - trb[j].xp;
  float dy = trb[i].yp - trb[j].yp;

  float sin = dy/sqrt(dx*dx + dy*dy);
  float cos = dx/sqrt(dx*dx + dy*dy);

  float xx = 0.5*s*sin;
  float yy = 0.5*s*cos;

  fill(#00C8C8);
  ellipse(trb[i].xp, trb[i].yp, s+6, s+6); 
  ellipse(trb[j].xp, trb[j].yp, s+6, s+6); 

  stroke(#00C8C8);
  strokeWeight(3); 
  line(trb[i].xp - xx, trb[i].yp - yy, trb[j].xp - xx, trb[j].yp - yy);
  line(trb[i].xp + xx, trb[i].yp + yy, trb[j].xp + xx, trb[j].yp + yy);
  noStroke();
}



void opinion(int j)
{
  // communicate to nearest if it isn't "bisy", communicating with other AO
  //
  // opinins: - 1   "enemy"
  //            0    no info / empty unit
  //            1    not bad
  //            2    friends
}


void collis(int id)
{
  float[] x = new float[num];  
  // 15 in one y; 8 in one 8

  for (int i = 0; i < num; i ++) x[i] = trb[i].xp;

  float min = x[0], max;

  for (int i = 0; i < num; i ++) 
    if (x[i] < min)
    {
      if (x[i] == trb[id].xp) id = i;
      max = x[i];
      x[i] = min;
      min = max;
    }

  for (int i=0; i < num; i++)
    if (i != 0 && i != num)
    {
      if (abs(x[id-1] - x[id]) < abs(x[id+1] - x[id]))
      {
      }
    }
}
