//SceneDelegate에 추가
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBar = UITabBarController()
        let fvc = ViewController()
        let svc = GesutureViewController()
        fvc.tabBarItem = UITabBarItem(title: "touches", image: .none, tag: 0)
        svc.tabBarItem = UITabBarItem(title: "gesture", image: .none, tag: 1)
        tabBar.viewControllers = [fvc, svc]
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBar
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
    
    @available(iOS 13.0, *)
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    @available(iOS 13.0, *)
    func sceneDidBecomeActive(_ scene: UIScene) {
        print(#function)
    }
    
    @available(iOS 13.0, *)
    func sceneWillResignActive(_ scene: UIScene) {
        print(#function)
    }
    
    @available(iOS 13.0, *)
    func sceneWillEnterForeground(_ scene: UIScene) {
        print(#function)
    }
    
    @available(iOS 13.0, *)
    func sceneDidEnterBackground(_ scene: UIScene) {
        print(#function)
    }
    
    
    
    
}
