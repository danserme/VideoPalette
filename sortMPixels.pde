color[] sortMPixels(color[] thepixels)  
{
  float[] newpixels=new float[thepixels.length];
  color[] result=new color[thepixels.length];

  int[] mappa=new int[thepixels.length];
  float[] np2=new float[thepixels.length];
  int[] m2=new int[thepixels.length];


  for (int i=0; i<newpixels.length; ++i)
  {
    newpixels[i]=hue(thepixels[i]);
    mappa[i]=i;
  }

  mymergesort(newpixels, np2, mappa, m2, 0, newpixels.length-1);   
  for (int i=0; i<newpixels.length; ++i)
  {
    result[i]=thepixels[mappa[i]];
  }
  return result;
}

void mymergesort(float[] vettore, float[] v2, int[] vettore2, int[] v22, int ini, int iend)
{
  if (ini<iend)
  {
    int centro=floor((ini+iend)/2);
    mymergesort(vettore, v2, vettore2, v22, ini, centro);
    mymergesort(vettore, v2, vettore2, v22, centro+1, iend);
    merge(vettore, v2, vettore2, v22, ini, centro, iend);
  }
}

void merge (float[] a, float[] b, int[] m, int[] n, int left, int center, int right)
{
  int i = left;
  int j = center + 1;
  int k = 0;

  while (i <=center && j <= right)
  { 
    if (a[i] <= a[j])
    {
      b[k] = a[i];
      n[k] = m[i];

      i = i + 1;
    } else
    {
      b[k] = a[j];
      n[k] = m[j];

      j = j + 1;
    }   
    k = k + 1;
  }

  while (i <= center)
  {
    b[k] = a[i];
    n[k] = m[i];

    i = i + 1;
    k = k + 1;
  }
  while (j <= right)
  {
    b[k] = a[j];
    n[k] = m[j];

    j = j + 1;
    k = k + 1;
  }
  for (int kk = left; kk<= right; kk++)
  {
    a[kk] = b[kk-left];
    m[kk] = n[kk-left];
  }
}
