function [Link] = get_link_matrix(Labyrinth)
    
    [n, m] = size(Labyrinth);

    Adj = get_adjacency_matrix(Labyrinth);

    Link = zeros(n*m + 2, n*m + 2);

   for i = 1:n*m+2

       sum = 0;

       for j = 1:n*m+2

           sum = sum + Adj(i, j);

       end

       for j = 1:n*m+2

           if sum ~= 0

               Link(i, j) = Adj(i, j) / sum;
               
           end
       end
   end
