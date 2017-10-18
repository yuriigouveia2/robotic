%Exemplo
%pose = [0 0 0];
%ranges = 10*ones(1,300);
%ranges(1,130:170) = 1;
%angles = linspace(-pi/2,pi/2,300);
%[nPose nCov] = AMCL(pose,  ranges, angles);

function [estPose, estCov] = ...
    AMCL(pose, ranges, angles)

%[x y teta]
InitialPose = [0 0 0];
estPose = InitialPose;

%covariancia/ Matriz 3x3 de covariancia de x, y e teta
InitialCovariance = eye(3);
estCov = InitialCovariance;

%numero de particulas [MIN MAX], serao usadas pelo MCL
ParticleLimits = [500 5000];

    [posePF estCov] = PF(max(ParticleLimits), pose, InitialCovariance);
    sum = [0 0 0];
    
    for i = 1:length(posePF)
    sum(1) = sum(1) + posePF(i,1);
    sum(2) = sum(2) + posePF(i,2);
    sum(3) = sum(3) + posePF(i,3);
    end
    
    estPose = sum/length(posePF);

end







