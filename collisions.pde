void antsSort(AO[] arr, int first, int last)
{
  int i = first;
  int j = last;
  float x = arr[(first+last)/2].xp;
  do
  {
    while (arr[i].xp < x) ++i;
    while (arr[j].xp > x) --j;
    if (i <= j)
    {
      float temp = arr[i].xp;
      arr[i].xp = arr[j].xp;
      arr[j].xp = temp;

      i++;
      j--;
    }
  } 
  while (i < j);
  if (first < j) antsSort(arr, first, j);
  if (i < last) antsSort(arr, i, last);
}

// Simple circle collision
int near(int j)
{
  int id = 0;
  //if ( ((pow(abs(b.xp - a.xp), 2)) + pow(abs(b.yp - a.yp), 2)) <= (b.D/2 + a.D/2) )
  return id;
}
