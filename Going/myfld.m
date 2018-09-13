% FLD classifies an input sample into either class 1 or class 2.
%
%   [output_class w] = myfld(input_sample, class1_samples, class2_samples) 
%   classifies an input sample into either class 1 or class 2,
%   from samples of class 1 (class1_samples) and samples of
%   class 2 (class2_samples).
%
% Input parameters:
% input_sample = an input sample
%   - The number of dimensions of the input sample is N.
%
% class1_samples = a NC1xN matrix
%   - class1_samples contains all samples taken from class 1.
%   - The number of samples is NC1.
%   - The number of dimensions of each sample is N.
%
% class2_samples = a NC2xN matrix
%   - class2_samples contains all samples taken from class 2.
%   - The number of samples is NC2.
%   - NC1 and NC2 do not need to be the same.
%   - The number of dimensions of each sample is N.
%
% Output parameters:
% output_class = the class to which input_sample belongs. 
%   - output_class should have the value either 1 or 2.
%
% w = weight vector.
%   - The vector length must be one.
%
function [output_class w] = myfld(input_sample, class1_samples, class2_samples)
[m1, n1] = size(class1_samples);
[m2, n2] = size(class2_samples);
mu1 = sum(class1_samples) / size(class1_samples, 1);
mu2 = sum(class2_samples) / size(class2_samples, 1);
s1 = 0;
s2 = 0;

for i = 1:m1
    s1 = s1 + (class1_samples(i,:) - mu1)' * (class1_samples(i,:) - mu1);
end
for i = 1:m2
    s2 = s2 + (class2_samples(i,:) - mu2)' * (class2_samples(i,:) - mu2);
end
sw = s1 + s2;
w = inv(sw)' * (mu1 - mu2)';
w1 = w(1) / (w(1) * w(1) + w(2) * w(2))^0.5;
w2 = w(2) / (w(1) * w(1) + w(2) * w(2))^0.5;
w = [w1; w2];
separationPoint = (mu1 + mu2) * w * 0.5;
output_class = (input_sample * w < separationPoint) + 1;