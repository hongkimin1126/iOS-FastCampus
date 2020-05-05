//MARK:  **************** 10버전과 , 13버전은 라이프사이클이 다르다.
//MARK: ##############ios 10번전으로 세팅헤도 시뮬레이터 기기고유 버전이 13버전이면 신을타니 제대로 확인할려면 버전이랑 시뮬레니터까지 일치시켜야함!!!
//MARK: 안되는예 10버전세팅하고 시뮬레이터 아이폰8 하면 안됨......   10버전은 시뮬레이터 아이폰7으로 세팅!!!

//AppDelegate에 추가
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(#function)
        if #available(iOS 13.0, *) {
            
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = ViewController()
            window?.backgroundColor = .white
            window?.makeKeyAndVisible()
        }
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    //MARK: 생태주기 확인 13버전 이하에서 사용하려면 믿에 함수사용하려면 만들어주어야한다.
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("--------------applicationWillEnterForeground------------------")
        //인액티브
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("--------------applicationDidBecomeActive------------------")
    }
    func applicationWillResignActive(_ application: UIApplication) {
        print("--------------applicationWillResignActive------------------")
        //인액티브: 백그라운드가기전
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("--------------applicationDidEnterBackground------------------")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("--------------applicationWillTerminate------------------")
    }
}



