function Adj = get_adjacency_matrix(Labyrinth)
    
    [n, m] = size(Labyrinth);
    
    Adj = zeros(n*m + 2, n*m + 2)

    for i = 1:n
        for j = 1:m
            if(bitget(Labyrinth(i,j),4) == 0)
                if (i == 1)
                    Adj((i-1)*m + j, n*m+1) = 1;
                else
                    Adj((i-1)*m + j, (i-2)*m + j) = 1;
                end
            end
            if(bitget(Labyrinth(i,j),3) == 0)
                if (i == n)
                    Adj((i-1)*m + j, n*m+1) = 1;
                else
                    Adj((i-1)*m + j, (i)*m + j) = 1;
                end
            end
            if(bitget(Labyrinth(i,j),2) == 0)
                if (j == m)
                    Adj((i-1)*m + j, n*m+2) = 1;
                else
                    Adj((i-1)*m + j, (i-1)*m + j + 1) = 1;
                end
            end
            if(bitget(Labyrinth(i,j),1) == 0)
                if (j == 1)
                    Adj((i-1)*m + j, n*m+2) = 1;
                else
                    Adj((i-1)*m + j, (i-1)*m + j - 1) = 1;
                end
            end
        end
    end
    
    Adj(n*m+1, n*m+1) = 1;
    Adj(n*m+2, n*m+2) = 1;
end