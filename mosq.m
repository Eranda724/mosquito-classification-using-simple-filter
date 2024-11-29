% Paths to the training and testing folders
trainPath = 'C:\Users\erand\OneDrive - University of Jaffna\myGit\mosquito-classification-using-simple-filter\train';
testPath = 'C:\Users\erand\OneDrive - University of Jaffna\myGit\mosquito-classification-using-simple-filter\test';

% Load training and testing data (dengue and non-dengue subfolders)
trainFiles = load_wav_files(trainPath);
testFiles = load_wav_files(testPath);

% Initialize variables for accuracy calculation
correctTrain = 0;
correctTest = 0;
totalTrain = numel(trainFiles);
totalTest = numel(testFiles);

% Process training files
for i = 1:totalTrain
    % Load the training file
    [trainData, fs] = audioread(trainFiles(i).name);
    
    % Compute energy ratio (this can be adjusted based on the spectrum analysis)
    energyRatio = filter_and_calculate_energy(trainData, fs);
    
    % Set a threshold for classification (adjust based on experimental results)
    if energyRatio > 0.8 % Example threshold for dengue
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

% Process testing files
for i = 1:totalTest
    % Load the testing file
    [testData, fs] = audioread(testFiles(i).name);
    
    % Compute energy ratio
    energyRatio = filter_and_calculate_energy(testData, fs);
    
    % Set a threshold for classification
    if energyRatio > 0.8
        classification = 'Dengue';
    else
        classification = 'Non-Dengue';
    end
    
    % Check if the classification is correct (based on folder name)
    if contains(testFiles(i).folder, 'dengue') && strcmp(classification, 'Dengue')
        correctTest = correctTest + 1;
    elseif contains(testFiles(i).folder, 'non-dengue') && strcmp(classification, 'Non-Dengue')
        correctTest = correctTest + 1;
    end
end

% Calculate accuracy
trainAccuracy = correctTrain / totalTrain;
testAccuracy = correctTest / totalTest;

% Display results
fprintf('Training Accuracy: %.2f%%\n', trainAccuracy * 100);
fprintf('Testing Accuracy: %.2f%%\n', testAccuracy * 100);

% Plot energy ratios for train and test samples
figure;
subplot(2, 1, 1);
hold on;
for i = 1:totalTrain
    [trainData, fs] = audioread(trainFiles(i).name);
    energyRatio = filter_and_calculate_energy(trainData, fs);
    plot(i, energyRatio, 'bo');
end
title('Energy Ratios for Training Files');
xlabel('File Index');
ylabel('Energy Ratio');

subplot(2, 1, 2);
hold on;
for i = 1:totalTest
    [testData, fs] = audioread(testFiles(i).name);
    energyRatio = filter_and_calculate_energy(testData, fs);
    plot(i, energyRatio, 'ro');
end
title('Energy Ratios for Testing Files');
xlabel('File Index');
ylabel('Energy Ratio');

% Helper function to load all .wav files from a directory (including subfolders)
function files = load_wav_files(directory)
    files = [];
    subfolders = {'dengue', 'non-dengue'}; % List of subfolders
    for i = 1:numel(subfolders)
        subfolderPath = fullfile(directory, subfolders{i});
        files = [files; dir(fullfile(subfolderPath, '*.wav'))]; % Collect .wav files
    end
    % Convert to full file paths
    for i = 1:numel(files)
        files(i).name = fullfile(files(i).folder, files(i).name); % Update with full path
    end
end

% Helper function to apply filter and calculate energy ratio
function energyRatio = filter_and_calculate_energy(soundData, fs)
    % Design a band-pass filter (adjust frequency ranges based on your observation)
    [b, a] = butter(4, [500 1500] / (fs / 2), 'bandpass'); % Example frequency range for mosquito sound
    filteredSignal = filter(b, a, soundData);
    
    % Calculate energy in original and filtered signals
    originalEnergy = sum(soundData.^2);
    filteredEnergy = sum(filteredSignal.^2);
    
    % Energy ratio
    energyRatio = filteredEnergy / originalEnergy;
end
