//
//  Theme.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 24/01/26.
//

import Foundation
import SwiftUI

enum Theme: String, CaseIterable {
	case ligth
	case dark
	case system

	// MARK: - Computed PRoperties
	var colorScheme: ColorScheme? {
		switch(self) {
		case .dark:
			return ColorScheme.dark
			
		case .ligth:
			return ColorScheme.light
			
		case .system:
			return nil
		}
	}
}
