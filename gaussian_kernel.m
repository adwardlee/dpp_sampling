function K = gaussian_kernel(x)
  n1sq = sum(x.^2,2);
  n1 = size(x,1);
  D = n1sq*ones(1,n1) + (n1sq*ones(1,n1))' -2 * x * x';
  %sigma = std2(x);
  sigma2 = median(D(:));
  K = exp(-D/(sigma2));
end
