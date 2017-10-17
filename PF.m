%Filtro de particulas
function [posePF covPF] = PF(numParticulas, initPose, initCov)

pf = robotics.ParticleFilter;
pf.StateEstimationMethod = 'mean';
pf.ResamplingMethod = 'systematic';

initialize(pf, numParticulas, initPose, initCov);

t = 0:0.1:4*pi;
dot = [t; sin(t)]';
posePF = zeros(length(t), 3);

for i = 1:length(t)
    [posePF(i,:), covPF] = predict(pf);
end
end