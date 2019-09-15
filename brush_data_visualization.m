%% temperary getting brushed data (reuse procedure)
all_data = [sel_cluster_data(:, 5), sel_cluster_data(:, 7), sel_cluster_data(:, 2)];
[~, select_dists] = knnsearch(brush_data1, all_data, 'K', 1);

select_idxs = find(select_dists < 1e-10);
unselect_idxs = find(select_dists >= 1e-10);
brush_cluster_data = sel_cluster_data(select_idxs, :);
unbrushed_cluster_data = sel_cluster_data(unselect_idxs, :);

sel_dim1 = 5; sel_dim2 = 7; sel_dim3 = 9;

close; figure();
scatter3(brush_cluster_data(:, sel_dim1), brush_cluster_data(:, sel_dim2), ...
    brush_cluster_data(:, sel_dim3), '*', 'b');
hold on;
scatter3(unbrushed_cluster_data(:, sel_dim1), unbrushed_cluster_data(:, sel_dim2), ...
    unbrushed_cluster_data(:, sel_dim3), '*', 'g');
