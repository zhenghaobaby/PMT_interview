close all; clear all; clc
load('firmSpecific.mat');
load('firmList.mat');

Financial_code = 10008;
industry_code = firmList(:,2);

Fin_flag = (industry_code== Financial_code);
Non_Fin_flag = not(Fin_flag);


for i=1:365
    daily_DTD = firmSpecific(i,6,:);%get the daily DTD of 35 companies
    daily_DTD = permute(daily_DTD,[3,2,1]);% transform into a 35x1 matrix
    
    DTD_median_Fin_value = median(daily_DTD(Fin_flag)); % use the Fin_flag 
    DTD_median_NonFin_value = median(daily_DTD(Non_Fin_flag));%use the NonFin_flag
    
    DTD_median_Fin = nan(length(daily_DTD),1);% initialize all nan value
    DTD_median_Fin(Fin_flag)=DTD_median_Fin_value;% use the Fin_flag make the Fin company have values
    
    DTD_median_NonFin = nan(length(daily_DTD),1);
    DTD_median_NonFin(Non_Fin_flag) = DTD_median_NonFin_value;
    
%     DTD_median_Fin = transpose(DTD_median_Fin);%tranpose the matrix to concat
%     DTD_median_NonFin = transpose(DTD_median_NonFin);
    
    data = firmSpecific(i,:,:);
    data = permute(data,[3,2,1]);
    data = horzcat(data,DTD_median_Fin,DTD_median_NonFin); %then data become 35x14 matrix
    merged_data(i,:,:) = data;    
end

save('merged_median_data.mat','merged_data');



