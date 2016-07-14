% Simple LSL script in MATLAB

lib = lsl_loadlib(); %instantiate the library

disp('Resolving an EEG stream...');
result = {};

while isempty(result);
	result = lsl_resolve_byprop(lib,'type','EEG'); end

%createe a new inlet
disp('Opening an inlet...');
inlet = lsl_inlet(result{1});

disp('Now receiving data...');
eeg_record = [];
i = 0;
while (size(eeg_record)<2500)
    [vec,ts] = inlet.pull_sample();
	eeg_record = [eeg_record;vec];
	fprintf('%.2f\t',vec)
 	fprintf('%.5f\n', ts)
    i = i+1;
end
% x = linspace(0,length(filtered(1:end,:)),length(filtered(1:end,:)));
% filtered = eeg_filter(eeg_record,1,50);
% plot(x,filtered)
% spectrogram(filtered(1:end,1),10,1,125,250)
% disp('done for now')