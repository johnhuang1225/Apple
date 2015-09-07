
## application life cycle
- Launch time
 * application:willFinishLaunchingWithOptions:
 * application:didFinishLaunchingWithOptions:
- Transitioning to the foreground
 * applicationDidBecomeActive:
- Transitioning to the background
 * applicationDidEnterBackground:
- Transitioning to the inactive state
 * applicationWillResignActive: (Called when leaving the foreground state.)
 * applicationWillEnterForeground: (Called when transitioning out of the background state.)
- Termination
 * applicationWillTerminate: (Called only when the app is running. This method is not called if the app is suspended.)


