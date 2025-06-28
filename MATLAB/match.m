function match(v, r)
 r = reshape(r,size(r,1)*size(r,2),1);
size(v);
figure(4);
%% Face recognition
% This algorithm uses the eigenface system (based on pricipal component
% analysis - PCA) to recognize faces. For more information on this method
% refer to http://cnx.org/content/m12531/latest/

%% Download the face database
% You can find the database at the follwoing link,
% http://www.cl.cam.ac.uk/research/dtg/attarchive/facedatabase.html The
% database contains 400 pictures of 40 subjects. Download the zipped
% database and unzip it in the same directory as this file.

%% Loading the database into matrix v
% w=load_database();
% load w.mat;
% load face_counter.mat;
N=20;                               % Number of signatures used for each image.
%% Subtracting the mean from v
O=uint8(ones(1,size(v,2)));
m=uint8(mean(v,2));                 % m is the mean of all images.
vzm=v-uint8(single(m)*single(O));   % vzm is v with the mean removed.

%% Calculating eignevectors of the correlation matrix
% We are picking N of the 400 eigenfaces.
L=single(vzm)'*single(vzm);
[V,~]=eig(L);
V=single(vzm)*V;
V=V(:,end:-1:end-(N-1));            % Pick the eignevectors corresponding to the 10 largest eigenvalues.


%% Calculating the signature for each image
cv=zeros(size(v,2),N);
for i=1:size(v,2)
    cv(i,:)=single(vzm(:,i))'*V;    % Each row in cv is the signature for one image.
end
subplot(121); 
 imshow(reshape(r,100,100));title('Looking for ...','FontWeight','bold','Fontsize',16,'color','red');
imwrite(reshape(r,100,100),'input.jpg','jpg');
subplot(122);
%% Recognition
%  Now, we run the algorithm and see if we can correctly recognize the face.
r = uint8(r);
p=r-m;                              % Subtract the mean
s=single(p)'*V;
z=[];
for i=1:size(v,2)
    z=[z,norm(cv(i,:)-s,2)];
end

no_of_min = 3;
value_min = [];
[~,~]=min(z); %find the most closest one

for k=1:no_of_min
    [~,i]=min(z); %find the most closest one
    z(i) = max(z);
    value_min = [value_min i];
end

 mu_min = mean(value_min);
%   delete(instrfind({'port'},{'COM3'}));
%   s=serial('COM3');
% s.BaudRate=9600;
% fopen(s);
if ((abs(value_min(1)-mu_min)<10) && (abs(value_min(2)-mu_min)<10) && (abs(value_min(3)-mu_min)<10))
   disp('KNOWN')
   subplot(122);
     imshow((reshape(v(:,value_min(1)),100,100))); title('Found!','FontWeight','bold','Fontsize',16,'color','black');
   
     %   cd(strcat(['Face_Database' filesep 'Person',num2str(abs(floor(value_min(1)/10)-1 ))])); 
%      s.ReadAsyncMode = 'continuous';
%      fprintf(s,1);
%     fclose(s);
% clear s  
  else 
   
    imshow('no_match.png');title('NO MATCH!','FontWeight','bold','Fontsize',16,'color','black');
%        Email();
    disp('UNKNOWN')
% clc
% fprintf(s,2);
end
clear
 
 