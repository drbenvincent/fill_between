function h = fill_between(x,y1,y2, where, opts)
% function originally written by Ben Vincent, July 2014. Inspired by a
% function of the same name available in the Matplotlib Python library.

% check hold status so we can return things to how they were 
initialHoldState=ishold(gca);
hold on

% ensure x, y1, y2 are row vectors
if isrow(x)~=1, x=x'; end
if isrow(y1)~=1, y1=y1'; end
if isrow(y2)~=1, y2=y2'; end

% if no 'where' vector is provided...
if numel(where)==0
    where=ones(size(x));
end

% if where = 1 then we assume we want to fill all regions
if numel(where)==1
	if where==1
		where=ones(size(x));
	end
end

% see if y1 OR y2 are constants
nx=numel(x); ny1=numel(y1); ny2=numel(y2); 
if nx==ny1 | nx==ny2
	%fine
else
	error('y1 or y2 have to be the same dimensions as x')
end

if ny1==1
	y1=ones(size(x))*y1;
end

if ny2==1
	y2=ones(size(x))*y2;
end

%%
% Check to see if 'where' contains just one zone, or many zones. We'll need
% to draw a patch for each zone. We are going to create a vector which will
% take on values of 0 for areas we will not fill, and areas >1 for areas we
% will fill. This vector will be integer valued, the number describing the
% region number.
region=0;
if where(1)==1
    region=1;
else
    region=0;
end
cat(1) = region;
% Now loop through the remaining entries
for n=2:numel(where)
    if where(n)==1 && where(n-1)==0
        % new region
        region=region+1;
    end
    if where(n)==0
        cat(n)=0;
    else
        cat(n)=region;
    end
end

% Now call the fill function for each  
if max(cat)==0
    error('no area to fill')
end
for n=1:max(cat)
    % ---------------------------------
    h(n) = fill_patch(x,y1,y2, cat==n);
    % ---------------------------------
end




%% Apply formatting

% cycle through options provided and apply them. These are patch properties
% which are listed here:
% http://www.mathworks.co.uk/help/matlab/ref/patch_props.html
for n=1:2:numel(opts)
    set(h, opts{n}, opts{n+1});
end

% move it to the back
uistack(h,'bottom') 

% return to initial hold state
if initialHoldState==0
	hold off
end


% make sure none of the fills run over the axes
set(gca,'Layer','top')



return
    
        




function h=fill_patch(x,y1,y2, where)
% Actually draw the filled patch 

default_col=[1 0 0];

x =[x(where==1),fliplr(x(where==1))];
y =[y1(where==1),fliplr(y2(where==1))];

% DRAW THE PATCH --------
h=patch(x,y,default_col);
% -----------------------
return

return