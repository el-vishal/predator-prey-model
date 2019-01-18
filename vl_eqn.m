%Function for Lotka Volterra
function pre_prey = vl_eqn(x,alpha,beta,gamma,ro)
pre_prey = zeros(2,1);
pre_prey(1) = (alpha*x(1))-(beta*x(1)*x(2));
pre_prey(2) = (ro*x(1)*x(2))-(gamma*x(2));