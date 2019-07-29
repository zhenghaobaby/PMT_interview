close all; clear all; clc
load('pfInfo.mat');

data = pfInfo.firmList;
Company_list = data(:,1);
Industry_code = data(:,7);
Industry_list = string({'Financial','Basic_Material','Communications','Consumer_cyclical',...
    'Consumer_noncyclical','Diversified','Energy','Industrial','Technology','Utilities'});
%create an Industry List frist

Industry_list_code =struct('Financial',10008,'Basic_Material',10002,'Communications',...
    10003,'Consumer_cyclical',10004,'Consumer_noncyclical',...
    10005, 'Diversified',10006,'Energy',10007, 'Industrial',...
    10011,'Technology',10013, 'Utilities',10014);
%create a dict to make the code more changeable

for i=1:length(Industry_list)
    temp = Industry_list_code.(Industry_list(i)); %according to the industry type to get the code
    flag = (Industry_code == temp); % according to the code to create a logic matrix
    companylist = Company_list(flag);
    industrylist = Industry_code(flag);
    output = table(companylist,industrylist,'VariableNames',{'firmList','Industrycode'});% create a table
    filename = sprintf('CompanyList_%s.csv',Industry_list(i));
    writetable(output,filename);%write to the csv
end
    














