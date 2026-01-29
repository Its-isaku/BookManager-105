//
//  FavoriteCard.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 17/01/26.
//

import SwiftUI

struct FavoriteCard: View {
	let book: PersistantBooks
	
	var body: some View {
		GeometryReader { geometry in
			ZStack {
				Image(uiImage: book.cover != nil ? UIImage(data: book.cover!)! : UIImage(resource: .lotrFellowship))
					.resizable()
					.scaledToFill()
					.frame(width: geometry.size.width, height: geometry.size.height)
					.clipped()

				LinearGradient(
					gradient: Gradient(colors: [.black.opacity(0.8), .clear, .black.opacity(0.8)]),
					startPoint: .top,
					endPoint: .bottom
				)

				
				VStack {
					Text(book.title)
						.font(.system(size: 16, weight: .bold))
						.multilineTextAlignment(.center)
						.foregroundColor(.white)
						.shadow(color: .black, radius: 2, x: 0, y: 1)
					
					Spacer()
					
					Text(book.author)
						.font(.system(size: 12))
						.foregroundColor(.white.opacity(0.9))
						.shadow(color: .black, radius: 2, x: 0, y: 1)
				}
				.padding(12)
			}
		}
		.aspectRatio(1.0, contentMode: .fit)
		.clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
		.shadow(radius: 2)
		.padding(5)
	}
}
