%axis captions
%legends


%initialisation
%first = [0.3, 1.7];
%second = [0.5, 1.5];
%third = [0.7, 1.3];
x_y_values = [0.3,1.7,0.5,1.5,0.7,1.3];
beta = 1;
gamma = 1;
ro = 1;

%solving differential equations and plotting graphs 
alpha = 1;

%time dependecies graph
time_steps = [0 25];
for i = 1:2:6
    [ts,x] = ode45(@(ts,x) vl_eqn(x,alpha,beta,gamma,ro),time_steps,x_y_values(i:i+1));
    figure(i+20);
    plot(ts,x(:,1),'',ts,x(:,2),''), xlabel('timestep'), ylabel('x,y values'),axis([0 25 0 5]) 
    title(['Lotka-Volterra - Time dependency - x = ',num2str(x_y_values(i)),' & y = ',num2str(x_y_values(i+1))]) %Title for graph
    legend('x - Preys','y - Predators')
end

%phase portrait
time_steps = [0 14];
figure(i+200); hold on
for i = 1:2:6
    [ts,x] = ode45(@(ts,x) vl_eqn(x,alpha,beta,gamma,ro),time_steps,x_y_values(i:i+1));
    plot(x(:,1),x(:,2))
    title(['Lotka-Volterra Phase Portrait - x = ',num2str(x_y_values(i)),' & y = ',num2str(x_y_values(i+1))]) %Title for graph
end
hold off

%Malthusian variable

%time dependecies graph
alpha = [1.25,2,4,8];
K = [0.2,0.5,0.75,0.875];
time_steps = [0 30];
for j = 1:4
    figure(j+10);hold on
    for i = 1:2:6
        [ts,x] = ode45(@(ts,x) vl_mal_eqn(x,alpha(j),beta,gamma,ro,K(j)),time_steps,x_y_values(i:i+1));
        
        plot(ts,x(:,1),'',ts,x(:,2),''), xlabel('timestep'), ylabel('x,y values'),axis([0 30 0 5])
        title(['Malthusian + Lotka-Volterra - Time dependency - K =',num2str(K(j)),' & \alpha = ',num2str(alpha(j))]) %Title for graph
    end
    hold off
end

%phase portrait
time_steps = [0 300];

for j = 1:4
    figure(j+2000);hold on
    for i = 1:2:6
        [ts,x] = ode45(@(ts,x) vl_mal_eqn(x,alpha(j),beta,gamma,ro,K(j)),time_steps,x_y_values(i:i+1));
        plot(x(:,1),x(:,2)), xlabel('prey - x'), ylabel('predators - y'),axis([0 2.5 0 2.5])
        title(['Malthusian + Lotka-Volterra Phase Portrait - K = ',num2str(K(j)),' & \alpha = ',num2str(alpha(j))]) %Title for graph
       
        %work on legendsssssssssss!
        %lk=num2str(x_y_values(i));
        %fk=num2str(x_y_values(i+1));
        %legendInfo{i} = ['x0 = ' lk]; %Legend for graph
        
    end
    %legend(legendInfo)
    hold off
end