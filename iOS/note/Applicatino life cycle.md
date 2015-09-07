
## application life cycle
- Launch time
 * `application:willFinishLaunchingWithOptions:`
 * `application:didFinishLaunchingWithOptions:`
  * 可觀察`UIApplicationDidFinishLaunchingNotification`
- Transitioning to the foreground
 * `applicationDidBecomeActive:`
  * 可觀察`UIApplicationDidBecomeActiveNotification`
- Transitioning to the background
 * `applicationDidEnterBackground:`
  * 可觀察`UIApplicationDidEnterBackgroundNotification`
- Transitioning to the inactive state
 * `applicationWillResignActive:` (Called when leaving the foreground state.)
  * 可觀察`UIApplicationWillResignActiveNotification`
 * `applicationWillEnterForeground:` (Called when transitioning out of the background state.)
  * 可觀察`UIApplicationWillEnterForegroundNotification`
- Termination
 * `applicationWillTerminate:` (Called only when the app is running. This method is not called if the app is suspended.)


