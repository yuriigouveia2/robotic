function [isUpdated, estPose, estCov] = ...
    AMCL(pose, ranges, angles)

%[x y teta]
InitialPose = [0 0 0];

%covariancia/ Matriz 3x3 de covariancia de x, y e teta
InitialCovariance = eye(3);

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

%Etapa de previsao, corre�ao e reamostragem
numranges = length(ranges);
%update(numranges,ranges,angles,pose);%VER AQUI


%Gera as saidas
%isUpdated = obj.isUpdated;%VER AQUI
%[estPose estCov] = getHypothesis;%VER AQUI


end


function [newPose, newCov] = getHypothesis(pose, cov)
            %getHypothesis Get estimated pose and covariance
            %   getHypothesis(MCLOBJ) returns the estimated pose and
            %   covariance of the highest weighted cluster of particles
            %   from the robotics.internal.algs.MonteCarloLocalization
            %   object MCLOBJ.
            
            posecov = mclObj.getHypothesis;
            posedata = reshape(posecov, 3, [])';
            newPose = posedata(1,:);
            newCov = posedata(2:4, :);
        end



