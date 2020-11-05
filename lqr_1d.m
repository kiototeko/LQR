A = zeros(2);
B = zeros(2,1);

A(1,2) = 1;
B(2) = 1;

%According to
%http://www.cds.caltech.edu/~murray/courses/cds110/wi06/lqr.pdf, we can use
%the identity matrix for the state cost and just vary the p parameter that
%multiplies the input cost

Q = eye(2); %State cost
p = 500; %This parameter should be varied until we get a good response
R = p*eye(1); %Input cost

N = 0;

K = lqr(A,B,Q,R,N);

H = 100; %Time horizon

x = zeros(H,2);

x(1,:) = [2,2]; %starting position and velocity

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
plot(1:(H-1), u)
xlabel('Time horizon')
ylabel('Acceleration')