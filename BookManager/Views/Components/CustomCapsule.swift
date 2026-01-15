//
//  CustomCapsule.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 14/01/26.
//

import SwiftUI

struct CustomCapsule: View {
    
	let text: String
	let color: Color = .accentColor
	
	var body: some View {
        Text(text)
			.font(.caption)
			.fontWeight(.bold)
			.foregroundColor(.secondary)
			.padding(8)
			.background(color.opacity(0.2))
			.clipShape(Capsule())
			
    }
}
