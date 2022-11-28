function [pridict_ans] = svm_grid(X_train,Y_train, grid_x,grid_y, sigma, lambda, b)
[row,col] = size(X_train);

[row1,col1] = size(grid_x);

kernel = zeros(row1,row1,row);
wTx = zeros(row1,row1);

for i=1:row1
    for k=1:row1
        for j=1:row
            kernel(j,i,k) = exp(-norm(X_train(j,:)-[grid_x(i,k) grid_y(i,k)])/(2*sigma*sigma));       
            wTx(i,k) = wTx(i,k) + lambda(j)*Y_train(j)*kernel(j,i,k);
        end
    end
end

pridict_ans= wTx+b;

end