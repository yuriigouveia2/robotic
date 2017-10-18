%Filtro de particulas
function [posePF covPF] = PF(numParticulas, initPose, initCov)

pf = robotics.ParticleFilter;
pf.StateEstimationMethod = 'mean';
pf.ResamplingMethod = 'systematic';

%Inicializa o filtro de particulas
initialize(pf, numParticulas, initPose, initCov);

%Intervalo para percorrer o caminho
t = 0:0.1:4*pi;
posePF = zeros(length(t), 3);

for i = 1:length(t)
    [posePF(i,:), covAux] = predict(pf);%Predict retorna a pose e cov estimadas
end
covPF = covAux/length(t);
end