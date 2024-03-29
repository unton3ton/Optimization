//Scilab 6.0.1

x0=[0.17;0.12;0.54;0.1;-0.25] // начальное приближение

// функция от вектора х, минимум которой ищется
function y=gg(x) 
b=0.5*(((sin(2*x(1))/sin(2*x(3)))*(sin(x(4))/sin(x(5))))^2*(2*(sin(x(1)))^2-(sin(x(2)))^2-(sin(x(3)))^2)-(sin(x(1)))^2);
a=((sin(2*x(1))/sin(2*x(3)))*(sin(x(4))/sin(x(5))))^2*(1-(sin(2*x(1))/sin(x(4)))^2);
c=(sin(x(4))/sin(2*x(3)))^2*((sin(x(1)))^2-(sin(x(3)))^2)*((sin(x(1)))^2-(sin(x(2)))^2);
y=sqrt(abs((b-sqrt(b^2-a*c))/a));
endfunction

// ind -- внутренний параметр для связи optim и cst
function [f,g,ind]=cst(x,ind)
f=gg(x);
g=numderivative(gg,x); // градиент функции
endfunction

funcprot(0) // убирает сообщение о переопределении функции
[f,xopt]=optim(cst,x0) // вызов функции optim

// Обозреватель переменных:
// f = 1.11e-06
// xopt = [0.16990802778180816;
//         0.16990802745648564;
//         0.08000248004883947;
//        -0.04017332779432595;
//        -0.0321342122449635;]
