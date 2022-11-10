clear;
clc;
pv_xy = readmatrix('PV_XY_1.xlsx');%%读取光伏组件坐标数据(XY坐标) 
trans_xy = readmatrix('TRANS_XY_1.xlsx');%%读取箱变坐标数据(XY坐标) 
n = length(pv_xy);


%% 开始优化
cvx_begin
    variable x1(2)
    minimize 5*(sum(norms(x1*ones(1,n) - pv_xy,1))) + 110*(norms(x1 - trans_xy))
cvx_end
disp(x1);



plot(pv_xy(1,:),pv_xy(2,:),'ro') ;
hold on 
plot(x1(1,:),x1(1,:),'b*') ;

z = sum(norms(x1*ones(1,n) - pv_xy,1))