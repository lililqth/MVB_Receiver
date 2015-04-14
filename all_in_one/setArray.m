A = zeros(1, 1500);
S = zeros(1, 1500);
for i = 1:length(S)
    S(i) = 0;
end
index = 1;
% 0010
for i = index:index+16
    A(i) = 0;
end
index = index + 16;
for i = index:index+16
    A(i) = 0;
end
index = index + 16;
for i = index:index+16
    A(i) = 1;
end
index = index + 16;
for i = index:index+16
    A(i) = 0;
end
index = index + 16;

% 11
for i = index:index+16
    A(i) = 1;
end
index = index + 16;
for i = index:index+16
    A(i) = 1;
end
index = index + 16;

% 000
for i = index:index+16
    A(i) = 0;
end
index = index + 16;
for i = index:index+16
    A(i) = 0;
end
index = index + 16;
for i = index:index+16
    A(i) = 0;
end
index = index + 16;

% 111
for i = index:index+16
    A(i) = 1;
end
index = index + 16;
for i = index:index+16
    A(i) = 1;
end
index = index + 16;
for i = index:index+16
    A(i) = 1;
end
index = index + 16;

% 000
for i = index:index+16
    A(i) = 0;
end
index = index + 16;
for i = index:index+16
    A(i) = 0;
end
index = index + 16;
for i = index:index+16
    A(i) = 0;
end
index = index + 16;

% 10101
for i = index:index+16
    A(i) = 1;
end
index = index + 16;
for i = index:index+16
    A(i) = 0;
end
index = index + 16;
for i = index:index+16
    A(i) = 1;
end
index = index + 16;
for i = index:index+16
    A(i) = 0;
end
index = index + 16;
for i = index:index+16
    A(i) = 1;
end
index = index + 16;

% 00
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;

% 0010
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;

for i = index:index+16
    A(i) = 1;
end

%11
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;

%000
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index=index+16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;

%111
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;

%000
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index=index+16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;

%10101
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;

% 0011ÖÕÖ¹²Ù×÷·û
for i = index:index+16
    A(i)= 0;
end
index = index+16;
for i = index:index+16
    A(i)= 0;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:index+16
    A(i)= 1;
end
index = index + 16;
for i = index:length(S)
    S(i) = 1;
end
A = logical(A);
S = logical(S);
array = timeseries(A);
read = timeseries(S);