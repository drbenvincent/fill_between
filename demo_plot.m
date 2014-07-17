% demo_plot.m
% Demonstrates use of the fill_between.m function

figure(1), clf
set(1, 'Color', [1 1 1])
%%
% Example 1 ===============================================================
subplot(2, 2, 1)
x = linspace(-pi, pi, 200);
y2 = sin(x*4);
y1 = zeros(size(x));

plot(x, y2, 'k-')
axis tight
box off

% define a binary vector of x values where we will fill
where = x>0 & x<pi/2;

% Define a set of patch properties that you want for your filled region
% See http://www.mathworks.co.uk/help/matlab/ref/patch_props.html
opts={'EdgeColor', 'none',...
      'FaceColor', [0.5 0.5 1]};

% Do the filling
h = fill_between(x, y1, y2, where, opts{:});

%%
% Example 2 ===============================================================
subplot(2, 2, 2)
x = linspace(-4, 4, 200);
y2 = sin(x*4)/2;
y1 = sin(x*2);

plot(x, y1, 'k-')
hold on
plot(x, y2, 'k-')
box off

% Define a set of patch properties that you want for your filled region
% See http://www.mathworks.co.uk/help/matlab/ref/patch_props.html
opts={'EdgeColor', 'none',...
      'FaceColor', [1 0.5 0.5]};

% Do the filling
fill_between(x, y1, y2, [], opts{:});

%%
% Example 3 ===============================================================
subplot(2, 2, 3)
x = linspace(-4, 4, 200);
y2 = sin(x*4)/2;
y1 = sin(x*2);

plot(x, y1, 'k-')
hold on
plot(x, y2, 'k-')
box off

% Do the filling
opts={'EdgeColor', 'none',...
      'FaceColor', [1 0.5 0.5]};
fill_between(x, y1, y2, y1>y2, opts{:});

opts={'EdgeColor', 'none',...
      'FaceColor', [0.5 1 0.5]};
fill_between(x, y1, y2, y1<y2, opts{:});


%%
% Example 4 ===============================================================
subplot(2,2,4)
x = linspace(-4,4,600);
y = sin(x*4);

plot(x, y, 'k-')
box off

% Do the filling
opts={'EdgeColor', 'none',...
      'FaceColor', [1 0.5 0.5]};
fill_between(x, 0.5, y, y>0.5, opts{:});

% Do the filling
opts={'EdgeColor', 'none',...
      'FaceColor', [0.5 1 0.5]};
fill_between(x, 0, y, y<0, opts{:});

