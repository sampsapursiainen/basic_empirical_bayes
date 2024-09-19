function [basic_eb_struct] = basic_eb(settings_file_name,data_file_name)

basic_eb_struct.program_path = mfilename("fullpath");
basic_eb_struct.program_path = fileparts(basic_eb_struct.program_path);

if nargin == 0 
settings_file_name = fullfile('settings','default_project');
end

if nargin < 2
data_file_name = '';
end

aux_cell = readcell('basic_eb.dat');

for i = 1 : size(aux_cell,1)
basic_eb_struct.(aux_cell{i,1}) = aux_cell{i,2};
end

basic_eb.init;

run(fullfile(basic_eb_struct.program_path,[settings_file_name '.m']));

if not(isempty(data_file_name))
basic_eb.load(data_file_name);
end

end