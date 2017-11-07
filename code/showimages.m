function showimages( burst )

[lig,col,dim,num]= size(burst);
k = round(num/3);

for i=1:num
    if(i<=k)
    axes('position',[(i-1+0.001*i)/k  2/3  0.9/k 1/3]);
    elseif(i<=(k+k))
    axes('position',[(i-k-1+0.001*i)/k  1/3  0.9/k  1/3]);
    else
    axes('position',[(i-k-k-1+0.001*i)/k  0  0.9/k  1/3]);
    end
    imshow(burst(:,:,:,i)/255);

        if(i<num)
            title(['image',num2str(i)]);
            xlabel(['mu=',num2str(round(evaluation(burst(:,:,:,i))))]);
        elseif(i==num)
            title('FBA');
            xlabel(['mu=',num2str(round(evaluation(burst(:,:,:,i))))]);
        
        end

end