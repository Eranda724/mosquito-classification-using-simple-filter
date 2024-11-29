% Process training files
for i = 1:totalTrain
    [trainData, fs] = audioread(trainFiles(i).name);
    
    % Plot the frequency domain (spectrogram) for each audio file
    figure;
    % Spectrogram computation
    spectrogram(trainData, 256, 200, 256, fs, 'yaxis');
    title(['Spectrogram of ', trainFiles(i).name]);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    
    % Optionally, save the plot as an image
    saveas(gcf, fullfile('path_to_save_plots', [trainFiles(i).name, '_FD_M.png']));
    
    % Compute energy ratio
    energyRatio = filter_and_calculate_energy(trainData, fs);
    
    % Store energy ratio for plotting
    if contains(trainFiles(i).folder, 'dengue')
        dengueTrainEnergy = [dengueTrainEnergy; energyRatio];
    else
        nonDengueTrainEnergy = [nonDengueTrainEnergy; energyRatio];
    end
    
    % Set a threshold for classification
    if energyRatio > 0.8
        classification = 'Dengue';
    else
        classification = 'Non-Dengue';
    end
    
    % Check if the classification is correct (based on folder name)
    if contains(trainFiles(i).folder, 'dengue') && strcmp(classification, 'Dengue')
        correctTrain = correctTrain + 1;
    elseif contains(trainFiles(i).folder, 'non-dengue') && strcmp(classification, 'Non-Dengue')
        correctTrain = correctTrain + 1;
    end
end
