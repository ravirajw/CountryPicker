//
//  CountriesListView.swift
//  
//
//  Created by Raviraj Wadhwa on 24/04/23.
//

import SwiftUI

struct CountriesListView: View {

    @Binding private var countryISOCode: String

    @State private var selectedCountryId: UUID

    @Environment(\.dismiss) private var dismiss

    init(countryISOCode: Binding<String>) {
        self._countryISOCode = countryISOCode

        let selectedCountry = NSLocale.countries.first { country in
            country.code == countryISOCode.wrappedValue
        }
        _selectedCountryId = .init(initialValue: selectedCountry?.id ?? UUID())
    }

    var body: some View {

        VStack(spacing: 0) {
            HStack {
                Text("Choose country")
                    .bold()
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "x.circle.fill")
                }
            }
            .padding()

            ScrollViewReader { scrollViewProxy in
                List {
                    ForEach(NSLocale.countries) { country in
                        countryCell(country)
                    }
                }
                .listStyle(.plain)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            scrollViewProxy.scrollTo(selectedCountryId, anchor: .center)
                        }
                    }
                }
                .background(Color.white)
            }
            .padding(.bottom)

        }
        .foregroundColor(.black)
        .ignoresSafeArea(edges: .bottom)

    }

    private func isSelectedCountry(_ countryId: UUID) -> Bool {
        countryId == selectedCountryId
    }

    private func countryCell(_ country: Country) -> some View {
        Button {
            selectedCountryId = country.id
            _countryISOCode.wrappedValue = country.code

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                dismiss()
            }
        } label: {
            VStack(spacing: 0) {
                HStack {
                    if let flag = country.flag {
                        Text(flag)
                    }
                    Text(country.name)
                    Spacer()
                    if isSelectedCountry(country.id) {
                        Image(systemName: "checkmark.circle.fill")
                    }
                }
                .padding()
            }
        }
        .id(country.id)
    }

}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView(countryISOCode: .constant("ZM"))
    }
}
