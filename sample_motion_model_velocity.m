function xt = sample_motion_model_velocity(ut, Xant)

a = 0.2;
b = 0.2;
c = 0.2;
d = 0.2;
e = 0.2;
f = 0.2;
dt = 0.04;

V = ut(1) + sample(a*abs(ut(1) + b*abs(ut(2))));
W = ut(2) + sample(c*abs(ut(1) + d*abs(ut(2))));
Fi = sample(e*abs(ut(1) + f*abs(ut(2))));

X = Xant(1) - (V/W)*sin(Xant(3)) + (V/W)*sin(Xant(3) + W*dt);
Y = Xant(2) + (V/W)*sin(Xant(3)) - (V/W)*sin(Xant(3) + W*dt);
Teta = Xant(3) + W*dt + Fi*dt;

xt = [X Y Teta];

end