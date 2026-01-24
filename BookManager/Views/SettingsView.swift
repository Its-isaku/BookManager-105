//
//  SettingsView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 24/01/26.
//

import SwiftUI

struct SettingsView: View {
	
	@AppStorage(SETTINGS_THEME_KEY) private var currentTheme:  Theme = DEFFAULT_SETTINGS_THEME_VALUE
	@AppStorage(FAVORITE_GRID_COLUMNS_KEY) private var numberOfColumns: Int = FAVORITE_GRID_COLUMNS_KEY_DEFAULT
	
    var body: some View {
        NavigationView() {
			Form {
				// Theme
				Section(header: Text("Appearence")) {
					Picker("Theme", selection: $currentTheme) {
						ForEach(Theme.allCases, id: \.self) { theme in
							Text(theme.rawValue).tag(theme)
						}
					}
				}
				
				// Grid
				Section(header: Text("DisplaySettigns")) {
					Stepper("Fav Section Columns: \(numberOfColumns)", value: $numberOfColumns, in: 1...4)
				}
			}
			.navigationTitle("Settings")
		}
    }
}

#Preview {
    SettingsView()
}
