//
//  SwiftUIView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 14/01/26.
//

import SwiftUI

struct StarRatingView: View {
    
	@Binding var rating: Int
	
	var body: some View {
		HStack {
			ForEach(1...5, id: \.self) { star in
				Button(action: {
					self.rating = star
				}) {
					Image(systemName: star <= self.rating ? "star.fill" : "star")
						.foregroundColor(Color.yellow)
				}.buttonStyle(.plain)
			}
		}
    }
}
