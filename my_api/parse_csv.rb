require 'csv'

a=CSV.read('test.csv')

for i in 0..(a.size-1)
    str=""
    for j in 0..(a[0].size-1)
        if a[i][j]==nil && i>1
            if j==0
                a[i][j]=a[i-1][j]
            elsif j==1
                a[i][j]=a[i-1][j]
            elsif j>1
                if a[i][0]==a[i-1][0] &&a[i][1]==a[i-1][1]
                    a[i][j]=a[i-1][j]   
                end    
            end      

        end    


        if a[i][j]!=nil 
            str+=a[i][j]+" "
        end   
    end

    p str 
end   


