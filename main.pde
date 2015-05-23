int s = 60;                   // main size: screen unit, blocks, diametr
int num = 8;                  // number of AOs in a tribe at t = 0
int max = 30;                 // 50 - max number of all AOs
int[] vacant = new int[max];  // stat-array with free-ID's

AO[] trb = new AO[max];       // tribe of AOs
PO[] ff = new PO[6];          // fields to feed on

color zer = #8C8C8C;          //(color(140, 140, 140)-grey) color of all AOs at t = 0
color font = #FFC800;         // for text; was: #EA8B15, #E6FA50, #FFFF98

float year = 0.0;  // year's timer

void setup()
{
  size(16*s, 9*s, P2D);          
  noStroke();          
  makefields();        // put feeding zones on the s-field
  build();             // put AOs on the field
}

void draw()
{
  background(#AAE678); 
  frame();

  antsSort(trb, 0, num - 1);
  
  for (int i = 0; i < 6; i ++) ff[i].update();
  for (int i = 0; i < num; i++) 
  {
    trb[i].live();
    trb[i].go(near(i));
  }

  year = year + 0.001;    // 'world' time
}
