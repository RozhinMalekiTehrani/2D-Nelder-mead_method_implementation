
%function [S]= space(ps, pnl , pl)
%S=1/4*( norm(ps-pl)+norm(ps-pnl)+ norm(pl-pnl)*(-norm(ps-pl)+norm(ps-pnl)+ norm(pl-pnl))*...
 %   ( norm(ps-pl)-norm(ps-pnl)+ norm(pl-pnl) * (norm(ps-pl)+norm(ps-pnl)- norm(pl-pnl))))^(1/2);
%end


tol=0.02;
f = @(x,y) x.^2+y.^2;
%f=@(x1.............. yadam raft
%f1 = @(x) f(x(1),x(2));
%f=@(x,y) x-2.*x.^2+2.*x.*y+ y.^2;
x=-20:0.25:20;

[X,Y]=meshgrid(x);
Z=f(X,Y);
surf(X,Y,Z)

contour(X,Y,Z);

hold on

%r=randi([0 1],1,3);
points=zeros(2,3);
p3=[5 5];
p1=[1 2];
p2=[4 0];
points=[p1',p2',p3'];
fp=zeros(1,3);
fp=f(points(1,:) ,points(2,:))
[fp,I]=sort(fp);
points=[points(:,I([1 2 3]))]
ps=points(:,1);
pnl=points(:,2);
pl=points(:,3);
tri=1:3;
  a=min(points(1,:));
    b=max(points(1,:));
    x=a:0.02 :b;
    [X,Y]=meshgrid(x);
Z=f(X,Y);
contour(X,Y,Z);
hold on
r=randi([0 1],1 ,3);
Iteration=0;
triplot(tri, points(1,:),points(2,:)...
    ,'color',r,'linewidth',2);
title({['Iteration=',num2str(Iteration)]...
    ;'STARTING'})

hold on;

S=space(ps,pnl,pl);

while (S>tol)
     disp(S);
    clf
    flag=0;
    pg=1/2*(ps+pnl);
    pr=2*pg-pl;
    fr=f(pr(1),pr(2));

    %Xmin=min(points(1,:))
    %Xmax=max(points(1,:))
   % x=Xmin:0.02 :Xmax
  x=a-5:0.02:b+5;
  [X,Y]=meshgrid(x);
Z=f(X,Y);
contour(X,Y,Z);
hold on
    
    % reflection
    if(fp(1)<=fr && fr<=fp(2))
        flag=1;
        pl=pr;
        points(:,3)=pl';
        fp(3)=f(pl(1),pl(2));
        [fp,I]=sort(fp);
        points=[points(:,I(1)), points(:,I(2)), points(:,I(3))];
        ps=points(:,1);
        pnl=points(:,2);
        pl=points(:,3);
         r=randi([0 1],1 ,3);
         triplot(tri, points(1,:),points(2,:)...
             ,'color',r,'linewidth',2);
         
                Iteration=Iteration+1  ;

         title({['Iteration=',num2str(Iteration)]...
             ;'The procedure of reflection'})
        S=space(ps,pnl,pl);
     
         
         
    end
    
    
    %expansion
    
    
   %Xmin=min(points(1,:))
    %Xmax=max(points(1,:))
   % x=Xmin-1:0.02 :Xmax+2
   x=a-5:0.02:b+5;
 [X,Y]=meshgrid(x);
Z=f(X,Y);
contour(X,Y,Z);
hold on



    
        if flag==0
            
   
            if (fr<fp(1))
    %    flag=1;
            pe=2*pr-pg;
            fe=f(pe(1),pe(2));
            if (fe<fr)
                flag=1;
                pl=pe;
                points(:,3)=pl';
                fp(3)=f(pl(1),pl(2));
                [fp,I]=sort(fp);
                points=points(:,I);
                ps=points(:,1);
                pnl=points(:,2);
                pl=points(:,3);
                
                 r=randi([0 1],1 ,3);
triplot(tri, points(1,:),points(2,:),...
    'color',r,'linewidth',2);
                            
Iteration=Iteration+1 ;
                            
title({['Iteration=',num2str(Iteration)]...
                ;'The procedure of expansion'})

                 
            else
                pl=pr;
                fp(3)=f(pl(1),pl(2));
                [fp,I]=sort(fp);
                points=[points(:,I(1)), points(:,I(2)), points(:,I(3))];
                ps=points(:,1);
                pnl=points(:,2);
                pl=points(:,3);
                
                 r=randi([0 1],1 ,3);
                 
      triplot(tri, points(1,:),points(2,:),...
          'color',r,'linewidth',2);
                %age fe behtar bashe (kamtar bashe )pas un jaye p worse
                %mishine
                            
               Iteration=Iteration+1 ;
           title({['Iteration=',num2str(Iteration)]...
              ;'The procedure of expansion'})

            end
    end
    end
    
   
    x=a-5:0.02:b+5;
  %Xmin=min(points(1,:))
 % Xmax=max(points(1,:))
%x=Xmin:0.02:Xmax;
[X,Y]=meshgrid(x);
Z=f(X,Y);
contour(X,Y,Z);
hold on

   % conraction
if flag==0 
       
    if(fr>=fp(2) && fr<fp(3))
                
                pc=pg+(1/2).*(pr-pg);
                fc=f(pc(1),pc(2));
               
                if (fc<fp(3))
                    
                     %condition for contraction is accepted
                     
                    flag=1;
                    
                    
                    pl=pc;
                    fp(3)=f(pl(1),pl(2));
                    [fp,I]=sort(fp);
                    points=[points(:,I(1)), points(:,I(2)), points(:,I(3))];
                    ps=points(:,1);
                    pnl=points(:,2);
                    pl=points(:,3);
                    
                     r=randi([0 1],1 ,3);
                 Iteration=Iteration+1 ; 

         triplot(tri, points(1,:),points(2,:),...
             'color',r,'linewidth',2);
                    
         title({['Iteration=',num2str(Iteration)]...
             ;'The procedure of contraction'})
              
                    S=space(ps ,pnl,pl);
                    
                end
    end
end





  
    
    
 %Xmin=min(points(1,:) )
  %Xmax=max(points(1,:) )


%x=Xmin:0.02:Xmax;
x=a-5:0.02:b+5;
[X,Y]=meshgrid(x);
Z=f(X,Y);
contour(X,Y,Z);
hold on







    %shrinkage
                
                if flag==0
                if (fr>=fp(2) && fr>=fp(3))

                    pl=ps+(1/2*(pl-ps));
                    pnl=ps+(1/2*(pnl-ps));
                    points(:,2:3)=[pnl ,pl];
                    fp=[f(ps(1),ps(2)) f(pnl(1),pnl(2)) f(pl(1),pl(2))];
                    [fp,I]=sort(fp);
                    points=[points(:,I(1)), points(:,I(2)), points(:,I(3))];
                    ps=points(:,1);
                    pnl=points(:,2);
                    pl=points(:,3);
                     r=randi([0 1],1 ,3);
triplot(tri, points(1,:),points(2,:),...
    'color',r,'linewidth',2);
                  Iteration=Iteration+1  ;
    title({['Iteration=',num2str(Iteration)];...
                  'The procedure of shrinkage'})
                    
           S=space(ps,pnl,pl);
                    
                end
               
                end
              pause(0.0002) 
scatter (ps(1),ps(2),'*')
title('optimal solution')
end
 
 
 
 
  %  S=1/4*( norm(ps-pl)+norm(ps-pnl)+ norm(pl-pnl)*(-norm(ps-pl)+norm(ps-pnl)+ norm(pl-pnl))*...
   %     ( norm(ps-pl)-norm(ps-pnl)+ norm(pl-pnl) * (norm(ps-pl)+norm(ps-pnl)- norm(pl-pnl))))^(1/2);
    