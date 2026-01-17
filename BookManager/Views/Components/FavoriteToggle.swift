//
//  FavoriteToggle.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 17/01/26.
//

import SwiftUI

struct FavoriteToggle: View {
	
	@Binding var isFavorite: Bool
	
	@State private var scale: CGFloat = 1
	@State private var opacity: CGFloat = 0
	@State private var offsetY: CGFloat = 0
	
    var body: some View {
		ZStack {
			//
			Image(systemName: "heart.fill")
				.foregroundColor(.red)
				.font(.largeTitle)
				.opacity(opacity)
				.scaleEffect(scale)
				.offset(x: 0, y: offsetY)
			
			// Toggle Btn
			Toggle(isOn: $isFavorite) {
				Image(systemName: "heart.fill")
					.foregroundColor(isFavorite ? .red : .gray)
			}
				.toggleStyle(.button)
				.buttonStyle(.plain)
				.animation(.spring, value: isFavorite)
				.accessibilityLabel(isFavorite ? "Unfavorite" : "Favorite")
				.onChange(of: isFavorite) {oldValue, newValue in
						guard newValue == true else { return }
				
					// appere and grow
					withAnimation(.spring(response: 0.4, dampingFraction: 0.2)) {
						opacity = 1
						scale = 1.2
					}
					
					// float and vanish
					withAnimation(.easeInOut(duration: 0.5).delay(0.2)) {
						offsetY = -120
						opacity = 0
						scale = 0.5
					}
					
					// whait for animation to finish / clean after 1 sec
					DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
						scale = 1
						offsetY = 0
					}
				}
		}
	}
}

