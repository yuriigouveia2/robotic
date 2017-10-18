%Exemplo
%
%xant = rand(5,3);
%ut = [5 0.5];
%out = sample_motion_model_velocity(ut, xant);
%
function xt = sample_motion_model_velocity(ut, Xant)

%Parametros de erro
a = 0.2;
b = 0.2;
c = 0.2;
d = 0.2;
e = 0.2;
f = 0.2;
%Varia�ao de tempo
dt = 0.04;

V = ut(1) + sample(a*abs(ut(1) + b*abs(ut(2))));%Vel linear com erro
W = ut(2) + sample(c*abs(ut(1) + d*abs(ut(2))));%Vel ang com erro
Fi = sample(e*abs(ut(1) + f*abs(ut(2))));%Desvio padrao de rota�ao

for i = 1:length(Xant)
    X(i) = Xant(i,1) - (V/W)*sin(Xant(i,3)) + (V/W)*sin(Xant(i,3) + W*dt);
    Y(i) = Xant(i,2) + (V/W)*sin(Xant(i,3)) - (V/W)*sin(Xant(i,3) + W*dt);
    Teta(i) = Xant(i,3) + W*dt + Fi*dt;
end

xt = [X' Y' Teta'];

motionModel = robotics.OdometryMotionModel;
motionModel.Noise = [0.2 0.2 0.2 0.2];

showNoiseDistribution(motionModel, 'OdometryPoseChange',...
    xt(1,1:3), 'NumSamples', 5000);


end