# ViewControllerTesting

I was having a few problems with unit testing view controllers so I decided to post on SO 
http://stackoverflow.com/questions/28733016/view-controller-tdd

With the help of the answers, I was able to find the solutions to my problems and here are the takeaways that I got:

1) I made anything class/method/variable that I want to test public. I do not need to add the swift files to the test target.

2) I only needed to set "Defines Module" for the "Main" target (as opposed to the "Test" target or the entire project)

3) When instantiating the storyboard, the bundle should be set to nil rather than NSBundle(forClass: self.dynamicType), otherwise tests will fail.

4) As modocache stated, it is good to give your view controller's a StoryboardID and instantiate them like so:

    viewController = storyboard.instantiateViewControllerWithIdentifier("FirstViewController") as FirstViewController
However, instantiating the view controller like this ONLY instantiates the view controller alone, and not any navigation controllers that it may be embedded in. That means, attempting to do

    XCTAssertFalse(viewController.navigationController!.navigationBarHidden, "Bar should show by default")
will result in a nil exception. I confirmed this with

    XCTAssertNil(viewController.navigationController?, "navigation controller doesn't exist")

which resulted in a successful test.

Since I wanted to check the state of the navigation bar in FirstViewController, you must instantiate the view controller like so:

    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let navigationController = storyboard.instantiateInitialViewController() as UINavigationController
    viewController = navigationController.topViewController as FirstViewController
Now performing the test

    XCTAssertFalse(viewController.navigationController!.navigationBarHidden, "nav bar should be showing by default")
results in a successful test.

5) let _ = viewController.view does indeed trigger viewDidLoad() which was confirmed by a test

6) let _ = viewController.view does not trigger viewWillAppear(), and I presume anything afterwards aswell. viewController.viewWillAppear(false/true) needs to be called manually to trigger it (Confirmed by a test).

