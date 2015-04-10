A = zeros(1, 300);
% 1
for i = 4:19
    A(i) = 1;
end
%0
for i = 20:35
    A(i) = 0;
end
%1
for i = 36:51
    A(i) = 1;
end
%0
for i = 62:67
    A(i) = 0;
end
%111
for i = 68:83
    A(i) = 1;
end
%000
for i = 84:99
    A(i) = 0;
end
%1
for i = 100:115
    A(i) = 1;
end
%0
for i = 116:163
    A(i) = 0;
end
%1
for i = 164:211
    A(i) = 1;
end
%0
for i = 212:259
    A(i) = 0;
end
%1
for i = 260:291
    A(i) = 1;
end
A = logical(A);
array = timeseries(A);