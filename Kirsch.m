function new_pic = Kirsch(image,plot)
    
    disp(['time that Kirsch_algoritm for ',image,' takes :']);
    tic();
    
    pic = imread(image);
    if size(pic,3) ~= 1
        pic_gray = rgb2gray(pic); 
    else
        pic_gray = pic;
    end
    
    
    % produce g_array :
    g(:,:,1) = [5 5 5; -3 0 -3; -3 -3 -3];
    g(:,:,2) = [5 5 -3; 5 0 -3; -3 -3 -3];
    g(:,:,3) = [5 -3 -3; 5 0 -3; 5 -3 -3];
    g(:,:,4) = [-3 -3 -3; 5 0 -3; 5 5 -3];
    g(:,:,5) = [-3 -3 -3; -3 0 -3; 5 5 5];
    g(:,:,6) = [-3 -3 -3; -3 0 5; -3 5 5];
    g(:,:,7) = [-3 -3 5; -3 0 5; -3 -3 5];
    g(:,:,8) = [-3 5 5; -3 0 5; -3 -3 -3];
    
    % produce h_array:
    h = zeros(size(pic_gray,1), size(pic_gray,2), 8);
    for i = 1:1:8
        S = conv2(pic_gray,g(:,:,i),'same');
        h(:,:,i) = uint8(S);
    end
    
    h_max = max(h,[],3);
    
    % make new_pic:
    new_pic = uint8(h_max);
    
    if(plot)
        % plot edge detected image with subplot
        figure;
        subplot(2,1,1);
        imshow(pic_gray);
        title('the gray original image');
    
        subplot(2,1,2);
        imshow(new_pic);
        title('the edge detected of original image with *Kirsch* algorithm');
    end

    toc()
end
