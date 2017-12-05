# Insert button in UINavigation Controller Programatically

```
let closeButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel,
                        target: self,
                        action: #selector({Your-viewController}.{close-method}))
self.navigationItem.leftBarButtonItem = closeButton

Objective C
============

UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
navBar.backgroundColor = [UIColor whiteColor];

UINavigationItem *navItem = [[UINavigationItem alloc] init];
navItem.title = @"Navigation Bar title here";

UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStylePlain target:self action:@selector(yourMethod:)];
navItem.leftBarButtonItem = leftButton;

UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Post" style:UIBarButtonItemStylePlain target:self action:@selector(yourOtherMethod:)];
navItem.rightBarButtonItem = rightButton;

navBar.items = @[ navItem ];

[self.view addSubview:navBar];

```
Reference:
https://stackoverflow.com/questions/5062088/trying-to-programmatically-add-a-button-to-uinavigationcontroller-but-it-never-s

#Insert UIView in UINavigation controller programatically

https://stackoverflow.com/questions/28702306/how-to-add-a-custom-uiview-to-navigation-bar-in-ios7-like-this
