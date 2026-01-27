//
//  BookManagerApp.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 07/01/26.
//

import SwiftUI
import SwiftData

@main
struct BookManagerApp: App {
	
	let modelContainer: ModelContainer
    var body: some Scene {
        WindowGroup {
            ContentView()
				.modelContainer(modelContainer)
        }
    }
	
	init() {
		do {
			modelContainer = try ModelContainer(
				for:
					PersistantBooks.self
			)
		} catch {
			fatalError("Failed to load the model container")
		}
	}
}
