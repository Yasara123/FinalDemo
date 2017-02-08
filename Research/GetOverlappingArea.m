function [ total,size] = GetOverlappingArea( class1,class2 )
total=0;
size=length(class1)+length(class2);
class1=round(class1,1);
class2=round(class2,1);
Cmin = min(min(class1), min(class2));
tblclass1 = tabulate(class1);
tblclass2 = tabulate(class2);
if Cmin == min(class1)
     i = 1;
    total = 0;
    while ((min(class2) > tblclass1(i, 1))&&(length(unique(tblclass1(:,1))) - i > 0))
        i = i + 1;
    end;
    if (length(unique(tblclass1(:,1)))==i)
        return ;
    end;
        
    k=1;
     while length(unique(class1)) - i >= 0
        if tblclass1(i, 1)==tblclass2(k, 1)
            total = total + min(tblclass1(i, 2), tblclass2(k, 2));
            i = i + 1;
            k = k + 1;
        elseif  tblclass1(i, 1)> tblclass2(k, 1)
            total = total +tblclass2(k, 2);   
            k = k + 1;
        else 
            total = total +tblclass1(i, 2);   
            i = i + 1;
        end;
    end;
end;
if Cmin == min(class2)
    i = 1;
    total = 0;
    while min(class1) > tblclass2(i, 1)
        i = i + 1;
    end;
    k=1;
    while length(unique(class2)) - i >= 0
        if tblclass2(i, 1)==tblclass1(k, 1)
            total = total + min(tblclass2(i, 2), tblclass1(k, 2));
            i = i + 1;
            k = k + 1;
        elseif  tblclass2(i, 1)> tblclass1(k, 1)
            total = total +tblclass1(k, 2);   
            k = k + 1;
        else 
            total = total +tblclass2(i, 2);   
            i = i + 1;
        end;
    end;
end;

end

