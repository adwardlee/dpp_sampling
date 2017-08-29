%matrix = load('/home/llj/tensorflow_s2vt/matlab_multitask_train_feature.txt');
%matrix = load('/home/llj/tensorflow_s2vt/matlab_multitask_val_feature.txt');
%matrix = load('/home/llj/tensorflow_s2vt/matlab_multitask_test_feature.txt');

val = 1200;
train = 0;
test = 1300;


%video_num = size(matrix,1)/60;
%feature_num = size(matrix,2);
files = fopen('10frame_dpp_median','a');

for i=1:1970
    filename = sprintf('/home/llj/tensorflow_s2vt/features_for_dpp/feature_vid%d',i);
    matrix = load(filename);
    feature = matrix;
    K = gaussian_kernel(feature);
    extracted_K = sample_dpp(decompose_kernel(K),10);
    fprintf(files,'vid%d\t',i);
    fprintf(files, [repmat('%d\t', 1, size(extracted_K', 2)) '\n'], extracted_K');
end
    