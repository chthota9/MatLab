% Charishma Thota, cthota@ucsc.edu
% matrix_times_vector.m: computes and outputs computes the product between an n-dimensional square matrix A and an n-dimensional (column) vector x

function [y] = matrix_times_vector(A,x)

i = 1; j = 1; n = size(A); row = n(2); sum = 0;
y = zeros(n,1);

for i = 1:row %outer to move down the matrix
        for j = 1:row % inner to move down the vector
        sum = sum + (A(i,j)*x(j));
        end
    y(i) = sum;
    sum = 0;
    j = 1;
end





