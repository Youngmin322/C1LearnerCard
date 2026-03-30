//
//  LearnerCardApp.swift
//  LearnerCard
//
//  Created by Youngmin Cho on 3/20/26.
//

import SwiftUI
import SwiftData

@main
struct LearnerCardApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Card.self,
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false,
            allowsSave: true,
        )

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
