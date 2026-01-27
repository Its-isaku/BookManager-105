//
//  Theme.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 24/01/26.
//

import Foundation
import SwiftUI

enum Theme: String, CaseIterable {
	case light
	case dark
	case system

	// MARK: - Computed Properties
	var colorScheme: ColorScheme? {
		switch(self) {
		case .dark:
			return ColorScheme.dark
			
		case .light:
			return ColorScheme.light
			
		case .system:
			return nil
		}
	}
}
