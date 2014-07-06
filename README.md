# fill_between.m

A Matlab function to fill selected areas in plots. This function was inspired by a function with the same name in the Python library, Matplotlib. 

The function has the following arguments:

    h = fill_between(x,y1,y2, where, opts);

* `x` is a vector of x locations
* `y1` and `y2` are vectors of y locations
* `where` is any binary vector specifying the conditions under which the regions between `y1` and `y2` will be filled. This is a nice property as we can plot a curve, and decide to only fill a particular region of that curve (see top left in figure below).
* `opts` is a cell array of patch properties which will be applied to the fill.

Functionality is demonstrated with the file `demo_plot.m`

![](demo.png)

But here is a snippet for the top left example:

    x   = linspace(-pi,pi,200);
	y2  = sin(x*4);
	y1  = zeros(size(x));
	plot(x,y2,'k-')
	 
	opts={'EdgeColor', 'none', 'FaceColor',[0.5 0.5 1]};
    	
    fill_between(x,y1,y2, x>0 & x<pi/2, opts);

If you'd like to improve the functionality, please do feel free to create a branch and submit a pull request.