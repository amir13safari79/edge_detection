function new_pic = sobel(image,plot)

    tic();
    disp(['time that sobel_algoritm for ',image,' takes :']);
    pic = imread(image);
    if(size(pic,3) ~= 1)
        pic_gray = rgb2gray(pic);
    else
        pic_gray = pic;
    end
    
    %produce Gx and Gy and G:
    Gx = [-1 0 1; -2 0 2; -1 0 1];
    Gy = [-1 -2 -1; 0 0 0; 1 2 1];
    
    S1 = conv2(pic_gray,Gx,'same');
    S2 = conv2(pic_gray,Gy,'same');
    new_pic = uint8(sqrt(S1.^2 + S2.^2));
    
    % plot edge detected image with subplot
    if(plot)
        figure;
        subplot(2,1,1);
        imshow(pic_gray);
        title('the gray original image');
    
        subplot(2,1,2);
        imshow(new_pic);
        title('the edge detected of original image with *sobel* algorithm');
    end
    
    toc();
end