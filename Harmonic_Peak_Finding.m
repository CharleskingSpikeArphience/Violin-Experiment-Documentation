function [peak_index] = Harmonic_Peak_Finding(f1_positive, Power_data_positive,fundamental_freq,multiple_num, fs, n1)

freq_interval = 20*multiple_num;%hz

integral_interval = round(freq_interval / (fs/n1));

differences = abs(f1_positive - multiple_num*fundamental_freq);
[minDifference, index] = min(differences);
begin = index - round(integral_interval/2);
finish = index + round(integral_interval/2);

% Define the range of indices
range = begin:finish;

% Extract the subset of the matrix within the given range
subset = Power_data_positive(range);

% Find the maximum value and its index within the subset
[max_value, max_index_local] = max(subset);

% Convert the local index to the global index
peak_index = range(max_index_local); %max_index_global

