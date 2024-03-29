function latticeRay = stepLightning(latticeV, dim)

latticeRay = latticeV;
d = 0.1;
%Resuelve para dimension 2
    if dim==2
        eta = 2.5;
        %Busca que puntos pueden ser nuevos
        puntosX = length(latticeV(:,1));
        puntosY = length(latticeV(1,:)); 
        voltMax = latticeV(puntosX,puntosY);
        puntosMax = (latticeV==voltMax);
        posibleBreak = zeros(puntosX,puntosY);
        dsqrt2 = d*sqrt(2);
        for i=2:puntosX-1
            for j=2:puntosY-1
                if puntosMax(i,j)==1 
                    if puntosMax(i+1,j)==0
                        posibleBreak(i+1,j)=abs((latticeV(i,j)-latticeV(i+1,j)))/d ;
                    end
                    if puntosMax(i-1,j)==0
                        posibleBreak(i-1,j)=abs((latticeV(i,j)-latticeV(i-1,j)))/d;
                    end
                    if puntosMax(i,j+1)==0
                        posibleBreak(i,j+1)=abs((latticeV(i,j)-latticeV(i,j+1)))/d;
                    end
                    if puntosMax(i,j-1)==0
                        posibleBreak(i,j-1)=abs((latticeV(i,j)-latticeV(i,j-1)))/d;
                    end
                    if puntosMax(i-1,j-1)==0
                        posibleBreak(i-1,j-1)=abs((latticeV(i,j)-latticeV(i-1,j-1)))/dsqrt2;
                    end
                    if puntosMax(i+1,j-1)==0
                        posibleBreak(i+1,j-1)=abs((latticeV(i,j)-latticeV(i+1,j-1)))/dsqrt2;
                    end
                    if puntosMax(i-1,j+1)==0
                        posibleBreak(i-1,j+1)=abs((latticeV(i,j)-latticeV(i-1,j-1)))/dsqrt2;
                    end
                    if puntosMax(i+1,j+1)==0
                        posibleBreak(i+1,j+1)=abs((latticeV(i,j)-latticeV(i+1,j+1)))/dsqrt2;
                    end
                end
            end
        end
        
        %Haya probabilidades
        posibleBreak = posibleBreak.^eta;
        posibleBreak = posibleBreak/sum(sum(posibleBreak));

        weigths = posibleBreak(:);
        nuevoP = randsample(puntosX*puntosY,1,true,weigths);
        latticeRay(rem(nuevoP,puntosX), fix(nuevoP/puntosX)+1) = voltMax;
  
%Resuelve para dimension 3        
    elseif dim==3
        puntosX = length(latticeV(:,1,1));
        puntosY = length(latticeV(1,:,1));
        puntosZ = length(latticeV(1,1,:));
        eta = 10;
        voltMax = latticeV(puntosX,puntosY,puntosZ);
        puntosMax = (latticeV==voltMax);
        posibleBreak = zeros(puntosX,puntosY,puntosZ);
        dsqrt2 = d*sqrt(2);
        dsqrt3 = d*sqrt(3);
        for i=2:puntosX-1
            for j=2:puntosY-1
                for k=1:puntosZ-1
                    if puntosMax(i,j,k)==1 
                        %Para k constante
                        if puntosMax(i+1,j,k)==0
                            posibleBreak(i+1,j,k)=abs((latticeV(i,j,k)-latticeV(i+1,j,k)))/d ;
                        end
                        if puntosMax(i-1,j,k)==0
                            posibleBreak(i-1,j,k)=abs((latticeV(i,j,k)-latticeV(i-1,j,k)))/d;
                        end
                        if puntosMax(i,j+1,k)==0
                            posibleBreak(i,j+1,k)=abs((latticeV(i,j,k)-latticeV(i,j+1,k)))/d;
                        end
                        if puntosMax(i,j-1,k)==0
                            posibleBreak(i,j-1,k)=abs((latticeV(i,j,k)-latticeV(i,j-1,k)))/d;
                        end
                        if puntosMax(i-1,j-1,k)==0
                            posibleBreak(i-1,j-1,k)=abs((latticeV(i,j,k)-latticeV(i-1,j-1,k)))/dsqrt2;
                        end
                        if puntosMax(i+1,j-1,k)==0
                            posibleBreak(i+1,j-1,k)=abs((latticeV(i,j,k)-latticeV(i+1,j-1,k)))/dsqrt2;
                        end
                        if puntosMax(i-1,j+1,k)==0
                            posibleBreak(i-1,j+1,k)=abs((latticeV(i,j,k)-latticeV(i-1,j+1,k)))/dsqrt2;
                        end
                        if puntosMax(i+1,j+1,k)==0
                            posibleBreak(i+1,j+1,k)=abs((latticeV(i,j,k)-latticeV(i+1,j+1,k)))/dsqrt2;
                        end
                        
                        %Para k+1
                        if puntosMax(i+1,j,k+1)==0
                            posibleBreak(i+1,j,k+1)=abs((latticeV(i,j,k)-latticeV(i+1,j,k+1)))/dsqrt2 ;
                        end
                        if puntosMax(i-1,j,k+1)==0
                            posibleBreak(i-1,j,k+1)=abs((latticeV(i,j,k)-latticeV(i-1,j,k+1)))/dsqrt2;
                        end
                        if puntosMax(i,j+1,k+1)==0
                            posibleBreak(i,j+1,k+1)=abs((latticeV(i,j,k)-latticeV(i,j+1,k+1)))/dsqrt2;
                        end
                        if puntosMax(i,j-1,k+1)==0
                            posibleBreak(i,j-1,k+1)=abs((latticeV(i,j,k)-latticeV(i,j-1,k+1)))/dsqrt2;
                        end
                        if puntosMax(i-1,j-1,k+1)==0
                            posibleBreak(i-1,j-1,k+1)=abs((latticeV(i,j,k)-latticeV(i-1,j-1,k+1)))/dsqrt3;
                        end
                        if puntosMax(i+1,j-1,k+1)==0
                            posibleBreak(i+1,j-1,k+1)=abs((latticeV(i,j,k)-latticeV(i+1,j-1,k+1)))/dsqrt3;
                        end
                        if puntosMax(i-1,j+1,k+1)==0
                            posibleBreak(i-1,j+1,k+1)=abs((latticeV(i,j,k)-latticeV(i-1,j+1,k+1)))/dsqrt3;
                        end
                        if puntosMax(i+1,j+1,k+1)==0
                            posibleBreak(i+1,j+1,k+1)=abs((latticeV(i,j,k)-latticeV(i+1,j+1,k+1)))/dsqrt3;
                        end
                        if puntosMax(i,j,k+1)==0
                            posibleBreak(i,j,k+1)=abs((latticeV(i,j,k)-latticeV(i,j,k+1)))/d;
                        end
                        
                        
                        %Para k-1
                        if puntosMax(i,j,k-1)==0
                            posibleBreak(i,j,k-1)=abs((latticeV(i,j,k)-latticeV(i,j,k-1)))/d;
                        end
                        if puntosMax(i+1,j,k-1)==0
                            posibleBreak(i+1,j,k-1)=abs((latticeV(i,j,k)-latticeV(i+1,j,k-1)))/dsqrt2 ;
                        end
                        if puntosMax(i-1,j,k-1)==0
                            posibleBreak(i-1,j,k-1)=abs((latticeV(i,j,k)-latticeV(i-1,j,k-1)))/dsqrt2;
                        end
                        if puntosMax(i,j+1,k-1)==0
                            posibleBreak(i,j+1,k-1)=abs((latticeV(i,j,k)-latticeV(i,j+1,k-1)))/dsqrt2;
                        end
                        if puntosMax(i,j-1,k-1)==0
                            posibleBreak(i,j-1,k-1)=abs((latticeV(i,j,k)-latticeV(i,j-1,k-1)))/dsqrt2;
                        end
                        if puntosMax(i-1,j-1,k-1)==0
                            posibleBreak(i-1,j-1,k-1)=abs((latticeV(i,j,k)-latticeV(i-1,j-1,k-1)))/dsqrt3;
                        end
                        if puntosMax(i+1,j-1,k-1)==0
                            posibleBreak(i+1,j-1,k-1)=abs((latticeV(i,j,k)-latticeV(i+1,j-1,k-1)))/dsqrt3;
                        end
                        if puntosMax(i-1,j+1,k-1)==0
                            posibleBreak(i-1,j+1,k-1)=abs((latticeV(i,j,k)-latticeV(i-1,j+1,k-1)))/dsqrt3;
                        end
                        if puntosMax(i+1,j+1,k-1)==0
                            posibleBreak(i+1,j+1,k-1)=abs((latticeV(i,j,k)-latticeV(i+1,j+1,k-1)))/dsqrt3;
                        end                        
                    end
                end
            end
        end
        
        %Probabilidades
        posibleBreak = posibleBreak.^eta;
        posibleBreak = posibleBreak/sum(sum(sum(posibleBreak)));

        weigths = posibleBreak(:);
        nuevoP = randsample(puntosX*puntosY*puntosZ,1,true,weigths);
        latticeRay(rem(rem(nuevoP,puntosX*puntosY),puntosX), fix(rem(nuevoP,puntosX*puntosY)/puntosX)+1, fix(nuevoP/(puntosX*puntosY))+1) = voltMax;

    else
        fprintf("# de dimensiones invalido")
    end

end