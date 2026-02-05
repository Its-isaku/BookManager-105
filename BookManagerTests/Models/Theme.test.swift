//
//  Theme.test.swift
//  BookManagerTests
//
//  Created by Isai Magdaleno Almeraz Landeros on 04/02/26.
//

import Testing
@testable import BookManager
import SwiftUI

@MainActor @Suite("Theme tests")
struct ThemeTests {

    @Test("Theme init dark test")
    func darkInit() async throws {
        // Arrange
        let theme: Theme = .dark
        
        // Act
        let colorScheme = theme.colorScheme
        
        // Assert
        #expect(colorScheme == .dark)
    }
	
	@Test("Theme init light test")
    func lightInit() async throws {
        // Arrange
        let theme: Theme = .light
        
        // Act
        let colorScheme = theme.colorScheme
        
        // Assert
        #expect(colorScheme == .light)
    }
	
	@Test("Theme init system (follow system) test")
    func systemInit() async throws {
        // Arrange
		let theme: Theme = .system
        
        // Act
        let colorScheme = theme.colorScheme
        
        // Assert
		#expect(colorScheme == nil)
    }
}

