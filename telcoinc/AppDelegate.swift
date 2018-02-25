//
// AppDelegate.swift
// telcoinc
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 25/02/18
//

import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPCommon
import SAPOData
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate, OnboardingManagerDelegate {

    var window: UIWindow?

    private let logger = Logger.shared(named: "AppDelegateLogger")
    var espmContainer: ESPMContainer<OnlineODataProvider>!

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // Set a FUIInfoViewController as the rootViewController, since there it is none set in the Main.storyboard
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = FUIInfoViewController.createSplashScreenInstanceFromStoryboard()

        do {
            // Attaches a LogUploadFileHandler instance to the root of the logging system
            try SAPcpmsLogUploader.attachToRootLogger()
        } catch {
            self.logger.error("Failed to attach to root logger.", error: error)
        }

        UINavigationBar.applyFioriStyle()

        OnboardingManager.shared.delegate = self
        OnboardingManager.shared.onboardOrRestore()

        return true
    }

    // To only support portrait orientation during onboarding
    func application(_: UIApplication, supportedInterfaceOrientationsFor _: UIWindow?) -> UIInterfaceOrientationMask {
        switch OnboardingFlowController.presentationState {
        case .onboarding, .restoring:
            return .portrait
        default:
            return .allButUpsideDown
        }
    }

    // Delegate to OnboardingManager.
    func applicationDidEnterBackground(_: UIApplication) {
        OnboardingManager.shared.applicationDidEnterBackground()
    }

    // Delegate to OnboardingManager.
    func applicationWillEnterForeground(_: UIApplication) {
        OnboardingManager.shared.applicationWillEnterForeground()
    }

    func onboarded(onboardingContext: OnboardingContext) {
        self.configureOData(onboardingContext.sapURLSession, onboardingContext.authenticationURL!)
        self.setRootViewController()

        self.uploadLogs(onboardingContext.sapURLSession, onboardingContext.sapcpmsSettingsParameters!)
    }

    private func setRootViewController() {
        DispatchQueue.main.async {
            let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()!

            viewController.modalPresentationStyle = .currentContext
            
            self.window!.rootViewController = UINavigationController(rootViewController: viewController)
        }
    }

    // MARK: - Split view
    func splitViewController(_: UISplitViewController, collapseSecondary _: UIViewController, onto _: UIViewController) -> Bool {
        // The first Collection will be selected automatically, so we never discard showing the secondary ViewController
        return false
    }

    // MARK: - Log uploading

    // This function is invoked on every application start, but you can reuse it to manually triger the logupload.
    private func uploadLogs(_ urlSession: SAPURLSession, _ settingsParameters: SAPcpmsSettingsParameters) {
        SAPcpmsLogUploader.uploadLogs(sapURLSession: urlSession, settingsParameters: settingsParameters) { error in
            if let error = error {
                self.logger.error("Error happened during log upload.", error: error)
                return
            }
            self.logger.info("Logs have been uploaded successfully.")
        }
    }

    // MARK: - Configure OData
    private func configureOData(_ urlSession: SAPURLSession, _ serviceRoot: URL) {
        let odataProvider = OnlineODataProvider(serviceName: "ESPMContainer", serviceRoot: serviceRoot, sapURLSession: urlSession)
        // Disables version validation of the backend OData service
        // TODO: Should only be used in demo and test applications
        odataProvider.serviceOptions.checkVersion = false
        self.espmContainer = ESPMContainer(provider: odataProvider)
        // To update entity force to use X-HTTP-Method header
        self.espmContainer.provider.networkOptions.tunneledMethods.append("MERGE")
    }
}
