//
//  emergency_callerApp.swift
//  emergency caller
//
//  Created by 黄家骏 on 5/18/23.
//

import SwiftUI

@main
struct emergency_callerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SizingView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
