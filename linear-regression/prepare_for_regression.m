function [FeatureMatrix] = prepare_for_regression(InitialMatrix)

  for i = 1:size(InitialMatrix, 1)

      for j = 1:size(InitialMatrix, 2)

          if strcmp(InitialMatrix{i,j},'yes')

              InitialMatrix{i,j} = 1;

          elseif strcmp(InitialMatrix{i,j},'no')

              InitialMatrix{i,j} = 0;

          elseif strcmp(InitialMatrix{i,j},'semi-furnished')

              InitialMatrix{i,j} = [1 0];

          elseif strcmp(InitialMatrix{i,j},'unfurnished')

              InitialMatrix{i,j} = [0 1];

          elseif strcmp(InitialMatrix{i,j},'furnished')

              InitialMatrix{i,j} = [0 0];

          else

              InitialMatrix{i,j} = str2double(InitialMatrix{i,j});

          end
      end
  end

  FeatureMatrix = cell2mat(InitialMatrix);

  if size(FeatureMatrix, 2) > 13

    FeatureMatrix = FeatureMatrix(:,1:end-1);
    
  end  
end
