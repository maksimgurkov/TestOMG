import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let verticalModule = VerticalListAssembly.assemble()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = verticalModule
        window?.makeKeyAndVisible()
        return true
    }
}

