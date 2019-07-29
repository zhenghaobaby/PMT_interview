close all; clear all; clc
load('dtd_mle_2000.mat');

month_end_day =[131,228,329,430,531];% crate a list to indicate the final day of the month
date = firmDtd(:,2);
DTD_value = firmDtd(:,3);
dtd_mle_2000_monthly = [];

for i=1:length(month_end_day)
    date_minis = date - month_end_day(i);
    flag = (mod(date_minis,10000)==0);% only the end day of the month has no remainder
    index_number = find(flag); %according to the flag to find the index of the end day
    while isnan(DTD_value(index_number))==1&index_number>=1 % if the end day is NAN,try to find the last one
        index_number = index_number-1;
        if index_number == 0  % if all the datas before the end day are NAN
            break
        end
    end
    if index_number == 0
        index_number = length(date); % if the single month are NAN
    end
    dtd_mle_2000_monthly = [dtd_mle_2000_monthly,DTD_value(index_number)]; 
end


save ('dtd_mle_2000_monthly.mat','dtd_mle_2000_monthly');
    
