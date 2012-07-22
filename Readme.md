#GSPopOverBarButtonItem

Introduction: Tap the barButtonItem and a popOver will show up which you can add subViews on.

Unfinished yet! ("Right side" style only, currently. But you can use now if you just need this style.)

##How to:

###Init

	GSPopOverBarButtonItem *popOverBarButtonItem = [[GSPopOverBarButtonItem alloc] initWithTitle:@"PopOver" style:UIBarButtonItemStyleBordered popOverBounds:CGRectMake(0, 0, 200, 80)];
	
	[self.navigationItem setRightBarButtonItem:_popOverBarButtonItem];

###Add subview

	UIView *popOverView = popOverBarButtonItem.popOverView;

Then you can add anything you want on the popOverView.(eg. two buttons)


###ScreenShot

![image](https://github.com/ultragtx/GSPopoverBarButtonItem/blob/master/ScreenShot/1.png?raw=true)

