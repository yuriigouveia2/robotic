function out = sample(b)
  
  %u1 = [v w];
  soma = 0;
  for i = 1:1:12
    soma = soma + i;
    out = (-b + (b+b)*rand(1, 1))*soma*0.5;
  end