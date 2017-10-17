function [isUpdated, estPose, estCov] = ...
    AMCL(pose, ranges, angles)

%[x y teta]
InitialPose = [0 0 0];
estPose = InitialPose;

%covariancia/ Matriz 3x3 de covariancia de x, y e teta
InitialCovariance = eye(3);
estCov = InitialCovariance;

%Modelo de movimento de odometria
MotionModel = robotics.OdometryMotionModel;

%designar um mapa de ocupa�ao (grid occupancy map) com um modelo de sensor
rangeFinderModel = robotics.LikelihoodFieldSensorModel;
%rangeFinderModel.Limits = [0.45 8];
rangeFinderModel.Map = IBOG();
%rangeFinderModel.SensorPose = ...
SensorModel = rangeFinderModel;

%localiza�ao global
GlobalLocalization = false;

%numero de particulas [MIN MAX], serao usadas pelo MCL
ParticleLimits = [500 5000];


%Mudan�a minima dos estados do robo [x,y,teta] para que aja uma 
%atualiza�ao das particulas do filtro.
UpdateThresholds = [0.2, 0.2, 0.2];

%Intervalo que representa o num de atualiza�oes do filtro a ser feito
%antes dos reescalonamento das particulas
ResamplingInterval = 1;

%Variavel que dira se houve mudan�a em rela�ao a uma posi�ao anterior
isUpdated = false;

%Etapa de previsao, corre�ao e reamostragem
numranges = length(ranges);
%update(numranges,ranges,angles,pose);%VER AQUI

difPose = abs(pose - InitialPose);
%Gera as saidas
if difPose(1) >  UpdateThresholds(1) || ...
        difPose(2) >  UpdateThresholds(2) ||...
        difPose(3) >  UpdateThresholds(3)
    
    isUpdated = true;
    estPose = 0;%MUDAR
    estCov = 0;%MUDAR
end


%isUpdated = obj.isUpdated;%VER AQUI
%[estPose estCov] = getHypothesis;%VER AQUI


end







