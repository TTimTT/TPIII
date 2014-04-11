#!/bin/awk -f

function facto(n)
{

 fact=1;
 for(i=n;i>1;i--)
  fact=fact*i;

 return fact

}

function poisson(x,mu)
{
	return ((mu**x)*(exp(-mu))/facto(x))
}

{
	mu=24.35
#    print ((($1-1) - 512*poisson($2,mu))/(sqrt(512*poisson($2,mu))))**2
	s += ((($1-1) - 512*poisson($2,mu))/(sqrt(512*poisson($2,mu))))**2
}
END { print s }

