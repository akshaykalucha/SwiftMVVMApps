import SwiftUI

@main
struct SwiftUI_MVVMApp: App {
    @StateObject var dm = WordleDataModel()
    
    var body: some Scene {
        WindowGroup {
            WordleView()
                .environmentObject(dm)
        }
    }
}
