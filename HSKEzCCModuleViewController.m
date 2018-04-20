#import "HSKEzCCModuleViewController.h"
#import <spawn.h>
#define colorRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface UIApplication (PrivateMethods)
- (BOOL)launchApplicationWithIdentifier:(NSString *)identifier suspended:(BOOL)suspend;
@end

@interface UIImage ()
+ (UIImage *)imageNamed:(NSString *)respringImg inBundle:(NSBundle *)bundle;
@end

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *myButton;

- (IBAction)didTouchUp:(id)sender;

@end

@implementation HSKEzCCModuleViewController


- (id)init {
	self = [super init];

	if (self) {
		self.height = 395;
		self.edgeinset = 11;

		//self.mediaViewController = [[NSClassFromString(@"HSKSettingsCardViewController") alloc] init];
		[self.view addSubview:self.mediaViewController.view];

		[[NSNotificationCenter defaultCenter] addObserver:self
		         selector:@selector(controlCenterDismissed)
		         name:@"com.laughingquoll.haystack.controlCenterDismissed"
		         object:nil];

		 [[NSNotificationCenter defaultCenter] addObserver:self
		         selector:@selector(controlCenterInvoked)
		         name:@"com.laughingquoll.haystack.controlCenterInvoked"
		         object:nil];

		 CGSize screenSize = [[UIScreen mainScreen] bounds].size;
		     if (screenSize.height == 812)
		         self.whiteOverlayView.layer.cornerRadius = 39;

		UIButton *respring=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		UIImage *respringImg = [UIImage imageNamed:@"respring.png" inBundle:[NSBundle bundleForClass:[self class]]];
    	respring.frame= CGRectMake(35, 0, 100, 100);
			[respring setImage:respringImg forState:UIControlStateNormal];
    	//[respring setTitle:@"Respring" forState:UIControlStateNormal];
    	[respring addTarget:self action:@selector(respringAction) forControlEvents:UIControlEventTouchUpInside];
    	[self.view addSubview:respring];

		UIButton *uicache=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		UIImage *uicacheImg = [UIImage imageNamed:@"uicache.png" inBundle:[NSBundle bundleForClass:[self class]]];
    	uicache.frame= CGRectMake(135, 0, 100, 100);
			[uicache setImage:uicacheImg forState:UIControlStateNormal];
			//uicache.tintColor = [UIColor redColor];
			[uicache setTintColor:[UIColor redColor]];
			//[uicache setTintColor:[UIColor redColor]forState:UIControlStateHighlighted]];
			//[uicache setBackgroundColor:[UIColor blueColor] forState:UIControlStateHighlighted];
			//[uicache setTintColor:[UIColor redColor] forState:UIControlStatePressed]];
			//works[uicache setBackgroundColor:[UIColor redColor]];
			//[uicache setBackgroundImage:[UIImage imageFromUIColor:[UIColor redColor]] forControlState:UIControlStatePressed];
    	//[uicache setTitle:@"UICache" forState:UIControlStateNormal];
			//[uicache addTarget:self action:@selector(setHighlighted) forControlEvents:UIControlEventTouchUpInside];
    	[uicache addTarget:self action:@selector(uicache) forControlEvents:UIControlEventTouchUpInside];
    	[self.view addSubview:uicache];

		UIButton *apollo=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		UIImage *apolloImg = [UIImage imageNamed:@"apollo.png" inBundle:[NSBundle bundleForClass:[self class]]];
    	apollo.frame= CGRectMake(235, 0, 100, 100);
			[apollo setImage:apolloImg forState:UIControlStateNormal];
    	//[apollo setTitle:@"Apollo" forState:UIControlStateNormal];
    	[apollo addTarget:self action:@selector(apollo) forControlEvents:UIControlEventTouchUpInside];
    	[self.view addSubview:apollo];

		UIButton *cydia=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		UIImage *cydiaImg = [UIImage imageNamed:@"cydia.png" inBundle:[NSBundle bundleForClass:[self class]]];
    	cydia.frame= CGRectMake(35, 100, 100, 100);
			[cydia setImage:cydiaImg forState:UIControlStateNormal];
    	//[cydia setTitle:@"Cydia" forState:UIControlStateNormal];
    	[cydia addTarget:self action:@selector(cydia) forControlEvents:UIControlEventTouchUpInside];
    	[self.view addSubview:cydia];

		UIButton *discord=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		UIImage *discordImg = [UIImage imageNamed:@"discord.png" inBundle:[NSBundle bundleForClass:[self class]]];
    	discord.frame= CGRectMake(135, 100, 100, 100);
			[discord setImage:discordImg forState:UIControlStateNormal];
    	//[discord setTitle:@"discord" forState:UIControlStateNormal];
    	[discord addTarget:self action:@selector(discord) forControlEvents:UIControlEventTouchUpInside];
    	[self.view addSubview:discord];

		UIButton *settings=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		UIImage *settingsImg = [UIImage imageNamed:@"settings.png" inBundle:[NSBundle bundleForClass:[self class]]];
    	settings.frame= CGRectMake(235, 100, 100, 100);
			[settings setImage:settingsImg forState:UIControlStateNormal];
    	//[settings setTitle:@"Settings" forState:UIControlStateNormal];
    	[settings addTarget:self action:@selector(settings) forControlEvents:UIControlEventTouchUpInside];
    	[self.view addSubview:settings];

		UIButton *safe=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		UIImage *safeImg = [UIImage imageNamed:@"safe.png" inBundle:[NSBundle bundleForClass:[self class]]];
    	safe.frame= CGRectMake(35, 200, 100, 100);
			[safe setImage:safeImg forState:UIControlStateNormal];
    	//[safe setTitle:@"Safe Mode" forState:UIControlStateNormal];
    	[safe addTarget:self action:@selector(safemode) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:safe];

		UIButton *icleaner=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		UIImage *icleanerImg = [UIImage imageNamed:@"icleaner.png" inBundle:[NSBundle bundleForClass:[self class]]];
    	icleaner.frame= CGRectMake(135, 200, 100, 100);
			[icleaner setImage:icleanerImg forState:UIControlStateNormal];
    	//[icleaner setTitle:@"iCleaner" forState:UIControlStateNormal];
    	[icleaner addTarget:self action:@selector(icleaner) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:icleaner];

		UIButton *youtube=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		UIImage *youtubeImg = [UIImage imageNamed:@"youtube.png" inBundle:[NSBundle bundleForClass:[self class]]];
    	youtube.frame= CGRectMake(235, 200, 100, 100);
			[youtube setImage:youtubeImg forState:UIControlStateNormal];
    	//[youtube setTitle:@"YouTube" forState:UIControlStateNormal];
    	[youtube addTarget:self action:@selector(youtube) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:youtube];

		UIButton *gauth=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		UIImage *gauthImg = [UIImage imageNamed:@"gauth.png" inBundle:[NSBundle bundleForClass:[self class]]];
    	gauth.frame= CGRectMake(35, 300, 100, 100);
			[gauth setImage:gauthImg forState:UIControlStateNormal];
    	//[gauth setTitle:@"Authenticator" forState:UIControlStateNormal];
    	[gauth addTarget:self action:@selector(gauth) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:gauth];

		UIButton *facetime=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		UIImage *facetimeImg = [UIImage imageNamed:@"facetime.png" inBundle:[NSBundle bundleForClass:[self class]]];
    	facetime.frame= CGRectMake(135, 300, 100, 100);
			[facetime setImage:facetimeImg forState:UIControlStateNormal];
    	//[facetime setTitle:@"FaceTime" forState:UIControlStateNormal];
    	[facetime addTarget:self action:@selector(facetime) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:facetime];

		UIButton *messages=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		UIImage *messagesImg = [UIImage imageNamed:@"messages.png" inBundle:[NSBundle bundleForClass:[self class]]];
    	messages.frame= CGRectMake(235, 300, 100, 100);
			[messages setImage:messagesImg forState:UIControlStateNormal];
    	//[messages setTitle:@"iMessages" forState:UIControlStateNormal];
    	[messages addTarget:self action:@selector(messages) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:messages];
			NSArray *subviews = self.view.subviews;
		   for (UIView *subview in subviews) {
		        NSLog(@"%@ SubviewsHere", subview);
						NSLog(@"rutabega so I can find the tag");
		        [self listSubviewsOfView:subview];
	    }

	}

	return self;
}
- (void)listSubviewsOfView:(UIView *)view {
    NSArray *subviews = [view subviews];
    for (UIView *subview in subviews) {
        NSLog(@"%@", subview);
				NSLog(@"rutabega");
        [self listSubviewsOfView:subview];
    }
}


- (void)viewDidLoad {
	[super viewDidLoad];


}

- (void)willBecomeActive {
}

- (void)willResignActive {
}

- (void)viewWillAppear:(BOOL)arg1 {
	self.mediaViewController.view.frame = CGRectMake(self.edgeinset, self.view.frame.size.height - self.height, self.view.frame.size.width - self.edgeinset*2, self.height);
}

- (void)viewWillLayoutSubviews {
	self.mediaViewController.view.frame = CGRectMake(self.edgeinset, self.view.frame.size.height - self.height, self.view.frame.size.width - self.edgeinset*2, self.height);
}

-(void)controlCenterDismissed {
  [self.mediaViewController setStyle:1];
  [self.mediaViewController _updateOnScreenForStyle:1];
}
-(void)controlCenterInvoked {
  [self.mediaViewController setStyle:3];
  [self.mediaViewController _updateOnScreenForStyle:3];
}

-(void)respringAction{
    pid_t pid;
    int status;
    const char* args[] = {"killall", "-9", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
}


- (void)uicache {
    pid_t pid;
    int status;
    const char* args[] = {"uicache", NULL, NULL, NULL};
    posix_spawn(&pid, "/usr/bin/uicache", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
		CFRunLoopRunInMode(kCFRunLoopDefaultMode, 20.0, false);

}

- (void)apollo {
  NSString *bundleID = @"com.christianselig.Apollo";
  [[UIApplication sharedApplication] launchApplicationWithIdentifier:bundleID suspended:FALSE];

}

- (void)cydia {
  NSString *bundleID = @"com.saurik.Cydia";
  [[UIApplication sharedApplication] launchApplicationWithIdentifier:bundleID suspended:FALSE];

}

- (void)discord {
  NSString *bundleID = @"com.hammerandchisel.discord";
  [[UIApplication sharedApplication] launchApplicationWithIdentifier:bundleID suspended:FALSE];
}

- (void)settings {
  NSString *bundleID = @"com.apple.Preferences";
  [[UIApplication sharedApplication] launchApplicationWithIdentifier:bundleID suspended:FALSE];
}

- (void)safemode {
    pid_t pid;
    int status;
    const char* args[] = {"killall", "-SEGV", "SpringBoard", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
}

- (void)icleaner {
  NSString *bundleID = @"com.exile90.icleanerpro";
  [[UIApplication sharedApplication] launchApplicationWithIdentifier:bundleID suspended:FALSE];
}

- (void)youtube {
  NSString *bundleID = @"com.google.ios.youtube";
  [[UIApplication sharedApplication] launchApplicationWithIdentifier:bundleID suspended:FALSE];
}

- (void)gauth {
  NSString *bundleID = @"com.google.Authenticator";
  [[UIApplication sharedApplication] launchApplicationWithIdentifier:bundleID suspended:FALSE];

}

- (void)facetime {
  NSString *bundleID = @"com.apple.facetime";
  [[UIApplication sharedApplication] launchApplicationWithIdentifier:bundleID suspended:FALSE];

}
- (void)messages {
  NSString *bundleID = @"com.apple.mobilesms";
  [[UIApplication sharedApplication] launchApplicationWithIdentifier:bundleID suspended:FALSE];

}

/*- (void)listSubviewsOfView:(UIView *)view {

    // Get the subviews of the view
    NSArray *subviews = [view subviews];

    // Return if there are no subviews
    if ([subviews count] == 0) return; // COUNT CHECK LINE

    for (UIView *subview in subviews) {

        // Do what you want to do with the subview
        NSLog(@"%@", subview);

        // List the subviews of subview
        [self listSubviewsOfView:subview];
    }
}*/

@end
