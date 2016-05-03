function SFM
    run('vlfeat-0.9.20/toolbox/vl_setup')
    
    im1 = im2single(imread(fullfile('House', 'frame00000001.png'))) ;
    im2 = im2single(imread(fullfile('House', 'frame00000002.png'))) ;
    
    [f1,d1] = vl_sift(im1);
    [f2,d2] = vl_sift(im2);
    
    [matches, scores] = vl_ubcmatch(d1,d2) ;
    
    xy1 = f1(1:2, matches(1, :))';
    x1 = xy1(:, 1);
    y1 = xy1(:, 2);
    xy2 = f2(1:2, matches(2, :))';
    x2 = xy2(:,1);
    y2 = xy2(:,2);
    %double(ones(size(x1)))
    
    A = [x1.*x2, x1.*y2, x1, y1.*x2, y1.*y2, y1, x2, y2, ones(size(x1))];
    
    [U,S,V] = svd(A);
    
    [n,m] = size(V);
    
    [M,I] = min(max(S));
    
    F = reshape(V(:,I),[3,3])
    
    
end