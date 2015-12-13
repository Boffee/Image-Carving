function [mask_seam, mask] = findSeam(ssd,k)
% find path with lowest cost form left ot right
% top half masked with 0 and bottom half masked with 1's

[h, w] = size(ssd);

path = zeros(h, w);
cumCost = zeros(h, w);
cumCost(:,1) = ssd(:,1);

for n = 2:w
   for m = 1:h
      bestCost = 1e12;
      bestPath = 0;
      for i = max(1, m-k):min(h,m+k)
          if cumCost(i, n-1) < bestCost
              bestCost = cumCost(i, n-1);
              bestPath = i;
          end
      end
      cumCost(m,n) = ssd(m, n)+bestCost;
      path(m,n) = bestPath;
   end
end

mask = zeros(h,w);
mask_seam = zeros(h,w);
backpath = find(cumCost(:,w)==min(cumCost(:,w)));
mask(backpath+1:end, w) = 1;
mask_seam(backpath,w) = 1;
for n = w:-1:2
   backpath = path(backpath,n);
   mask(backpath+1:end, n-1) = 1;
   mask_seam(backpath,n-1) = 1;
end
1;

