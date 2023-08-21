import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      if let _controller = window?.rootViewController as? FlutterViewController {
          let _channel = FlutterMethodChannel(name: "com.skyjar/native", binaryMessenger: _controller.binaryMessenger)

          _channel.setMethodCallHandler({
            (call: FlutterMethodCall, result: FlutterResult) -> Void in
              switch(call.method) {
              case "setupRakutenPoint":
                  // let kRPSDK_ClientId = "rp_point_partner_duskin_ios"
                  // let kRPSDK_ClientSecret = "880cf0656abb2e3c3e25bc7434470085e056b831c6345a46405bb5861dfc88925e9dff65c6b3d27fc6179de26e540ced"
                  // let kRPSDK_AppId = "duskin-misterdonut-app"
                  // let kRPSDK_AppSecret = "5acb1b1d5c5c929b4713b3c84c3def8dda99b554e06c953f8c8c6b3a3d3b13e0"
                  // let kRPSDK_ServiceId = "k116"
                  // let clientConfig = WBSDKClientConfig()
                  // clientConfig.clientId = kRPSDK_AppId
                  // clientConfig.clientUserId = kRPSDK_ClientId
                   
                  // WBSDK.presentWBSDK(on: self, clientConfig: clientConfig)

                  result("success")
              default:
                  result(FlutterMethodNotImplemented)
              }
          })
          
      }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
