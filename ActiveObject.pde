class AO 
{
  float xp, yp, D;              // position of a body
  float dx, dy, mk = 1.0;       // for move-visualisation

  color eat = #FFFF00;
  color sleep = #82AAC8; 
  color tex, gr;                // buffer and group 'texture' of AO

  int id;
  boolean died = true;

  float health = 100.0;         // health of AO at t = 0 (max health)
  float hungr = 0;             
  float age = 0;
  float tired = 0;

  float sociact;                // social activity of each AO   
  float abl = random(1, 10)/10; // const; social abilities of an AO
  float sq = random(100, 110);  // 'social' qoeficient - ability of communication
  float frnd;
  float socgr;                  // social group

  float[] mem = new float[10];  // opinion about each other

  AO(float x, float y, int d, color t, int n)
  {
    D = d;     // the diametr of a circle body
    xp = x;    // the X-centre of body
    yp = y;    // the Y-centre of body
    tex = t;   // the first color
    gr = t;
    id = n;    // identification number

    died = false;
  }


  void live()  // main AO-fuction
  {
    if (health <= 0) died = true;

    if (died == false)    // it would be drawn if it is dead
    {
      age = age + 0.001;
      hungr = hungr + 0.001;
      tired = tired + 0.001;

      behavior();

      correct_pos();  
      if ((mouseX > xp - s/2) && (mouseX < xp + s/2) && (mouseY > yp - s/2) && (mouseY < yp + s/2))
      {
        fill(font);           // circle over current AO
        ellipse(xp, yp, 1.25*D, 1.25*D);

        fill(tex);            // AO's body
        ellipse(xp, yp, D, D);

        infoboard();
      }
      else
      {
        fill(tex);
        ellipse(xp, yp, D, D);
      }
    }
  }


  void behavior()
  {
    frnd = sociact*abl;  // test

    //float socr = 0;             // social requuirements

    if (hungr*tired >= 0.6) check_bio();
    else if (hungr*tired < 0.6)
    {
      tex = gr;
      // 1. find nearest AO
      // 2. ask; if true 3, else 1
      // 3. inc/dec-rease opinion &
    }
    //move(xg, yg);
  }


  void check_bio()
  {
    if (hungr >= 1) 
    {
      doeat();
      health = health - 0.1*age*tired;
    }
    else if (tired > 1) dosleep();
    if ((tired > 5)&&(mk >= 0.1)) mk = mk - 0.01;
  }


  void correct_pos()   
  {  
    if (xp + dx < s) 
    {
      dx = 0;
      xp = s;
    }
    if (xp + dx > width - s) 
    {
      dx = 0;
      xp = width - s;
    }
    if (yp + dy < s) 
    {
      dy = 0;
      yp = s;
    }
    if (yp + dy > height - s) 
    {
      dy = 0;
      yp = height - s;
    }

    xp = xp + dx;
    yp = yp + dy;
  }





  void doeat()  
  {
    cc(eat);

    float[] dm = new float[6];
    int in = 0;

    for (int i = 0; i < 6; i ++) 
      if (ff[i].fquant > 0) dm[i] = sqrt(pow(ff[i].xp - xp, 2) + pow(ff[i].yp - yp, 2));
      else if (ff[i].fquant == 0) dm[i] = -1;

    float min = dm[in];
    for (int i = 1; i < 6; i ++) 
      if ((dm[i] < min) && (dm[i] != -1))
      {
        min = dm[i];
        in = i;
      }

    if ((xp > ff[in].xp)&&(xp < ff[in].xp + ff[in].xn*s)&&(yp > ff[in].yp)&&(yp < ff[in].yp + ff[in].yn*s))
    {
      if (ff[in].fquant > 0)
      {
        ff[in].fquant = ff[in].fquant - 1;
        hungr = hungr - 2;
        if (hungr < 0) hungr = 0;
      }
    }
    else move(ff[in].xp + (ff[in].xn*s)/2, ff[in].yp + (ff[in].yn*s)/2);
  }


  void dosleep()
  {
    cc(sleep);
    ///aaround();

    if ((dx == 0)&&(dy ==0)) tired = tired/2;
    // think about sleep-places after adding communications
  }


  void envr()
  {
    sociact = 0;
    for ( int j = 0; j < num; j ++)
      if ( j != id) 
        sociact = sociact + sq/sqrt(pow((trb[id].xp - trb[j].xp), 2) + pow((trb[id].yp - trb[j].yp), 2));
  }


  void go(int n)
  {
    if (pow(xp - trb[n].xp, 2) + pow(yp - trb[n].yp, 2) <= pow(1.7*s, 2))
    {
      float nx, ny;  // new x, new y
      if (trb[n].xp > xp)
      {
      }
      else if (trb[n].xp - xp < 0)
      {
      }
    }
  }


  void move(float x, float y)    
  {
    if ((x == xp)&&(y == yp)) 
    {
      dx = 0;    // "stops" the current AO
      dy = 0;
    }
    else
    {
      dx = mk*(x - xp)/sqrt((x - xp)*(x - xp) + (y - yp)*(y - yp));
      dy = mk*(y - yp)/sqrt((x - xp)*(x - xp) + (y - yp)*(y - yp));
    }
  }


  void cc(color z)   // change color function ( tex -> z )
  {
    if (tex != z)
    {
      float dr = red(z) - red(tex);
      float dg = green(z) - green(tex);
      float db = blue(z) - blue(tex);
      float st = max(dr, dg, db);
      tex = color(red(tex) + dr/st, green(tex) + dg/st, blue(tex) + db/st);
    }
  }


  void infoboard()
  {
    fill(font);                           // color of text on the AO
    textSize(0.4*s);                      // if it will grow 
    
    text(id, xp - 0.18*D, yp + 0.123*D);  // only ID on the body
    text("communicate: " + sociact + " ; ability: " + abl, s/2, 0.38*s);
    text("age: " + age + " ; hunger: " + hungr + " ; tired: " + tired + " ; health: " + health, s/2, height - 0.12*s);
    text("soc. abl: " + frnd, s/2, 0.88*s);
  }
}
