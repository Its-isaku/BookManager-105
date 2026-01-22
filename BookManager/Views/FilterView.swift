//
//  FilterView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 21/01/26.
//

import SwiftUI

struct FilterView: View {
	// State Variables
	@Binding var selectedGenre: Genre?
	@Binding var selectedReadingStatus: ReadingStatus?
	@State private var tempSelectedGenre: Genre? = nil
	@State private var tempSelectedReadingStatus: ReadingStatus? = nil
	@Environment(\.dismiss) private var dismiss

	init(selectedGenre: Binding<Genre?>, selectedReadingStatus: Binding<ReadingStatus?>) {
		self._selectedGenre = selectedGenre
		self._selectedReadingStatus = selectedReadingStatus
	}
	
    var body: some View {
		NavigationStack{
			Form {
				
				// Genre Section
				Section(header: Text("Select a Genre")) {
					Picker("Genre", selection: $tempSelectedGenre) {
						Text("Select a Genre...").tag(Genre?.none)
						ForEach(Genre.allCases, id: \.self) { genre in
							Text(genre.rawValue).tag(Genre?.some(genre))
						}
					}
				}
				
				// Reading Status Section
				Section(header: Text("Select a Reading Status")) {
					Picker("Reading Status", selection: $tempSelectedReadingStatus) {
						Text("Select a Status...").tag(ReadingStatus?.none)
						ForEach(ReadingStatus.allCases, id: \.self) { status in
							Text(status.rawValue).tag(ReadingStatus?.some(status))
						}
					}
				}
				
			}
			.onAppear {
				tempSelectedGenre = selectedGenre
				tempSelectedReadingStatus = selectedReadingStatus
			}
			.toolbar {
				
				// Apply Btn
				ToolbarItem(placement: .topBarLeading) {
					Button (action: {
						selectedGenre = tempSelectedGenre
						selectedReadingStatus = tempSelectedReadingStatus
						dismiss()
					}) {
						Image(systemName: "checkmark.circle")
					}
				}
				
				// Clear Btn
				ToolbarItem(placement: .topBarTrailing) {
					Button (action: {
						selectedGenre = nil
						selectedReadingStatus = nil
						tempSelectedGenre = nil
						tempSelectedReadingStatus = nil
						dismiss()
					}) {
						Image(systemName: "xmark.circle")
					}
				}
			}
			.navigationTitle(Text("favorite books filters"))
		}
    }
}
