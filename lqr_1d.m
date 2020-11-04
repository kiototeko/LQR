A = zeros(2);
B = zeros(2,1);
N = 0;
Q = eye(2);
p = 500;
R = p*eye(1);

A(1,2) = 1;
B(2) = 1;

K = lqr(A,B,Q,R,N);

H = 100;

x = zeros(H,2);

x(1,:) = [2,2];

for t=1:H-1
   u(t) = -K*x(t,:).';
   x(t+1,:) = A*x(t,:).' + B*u(t);
   
end

figure
yyaxis left
plot(1:H, x(:,1))
ylabel('Position')
yyaxis right
plot(1:H, x(:,2))
ylabel('Velocity')
xlabel('Time horizon')

figure
plot(1:H, u)
xlabel('Time horizon')
ylabel('Acceleration')