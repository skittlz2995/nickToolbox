function mask = createMask(array)
% Plot array and ask user for min max index for mask

if ndims(array)~=3
    error('Input must be 3 dimensions')
end

if ~isreal(array)
    array = db(array);
    warning('Converted complex input to db')
end

inputSize = size(array);

mask = zeros(inputSize);

for iTime = 1:inputSize(3)
    figure(1),clf
    imagesc(array(:,:,iTime)); 
    title([num2str(iTime),' of ',num2str(inputSize(3))])
    k = waitforbuttonpress;
    point1 = get(gca,'CurrentPoint');    % button down detected
    finalRect = rbbox;                   % return figure units
    point2 = get(gca,'CurrentPoint');    % button up detected
    point1 = point1(1,1:2);              % extract x and y
    point2 = point2(1,1:2);
    p1 = min(point1,point2);             % calculate locations
    offset = abs(point1-point2);         % and dimensions
  
    xCoords = [p1(1) p1(1)+offset(1) p1(1)+offset(1) p1(1) p1(1)];
    yCoords = [p1(2) p1(2) p1(2)+offset(2) p1(2)+offset(2) p1(2)];
    
    x1 = round(xCoords(1));
    x2 = round(xCoords(2));
    y1 = round(yCoords(5));
    y2 = round(yCoords(3));
    
    if(x1<1), x1=1; end
    if(y1<1), y1=1; end
    if(x2>inputSize(2)), x2 = inputSize(2); end
    if(y2>inputSize(1)), y2 = inputSize(1); end
    
    mask(y1:y2,x1:x2,iTime) = 1;
end







