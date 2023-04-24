//
//  CountryPicker.swift
//
//
//  Created by Raviraj Wadhwa on 24/04/23.
//

import SwiftUI

public struct CountryPicker: View {

    private let selectedColor = Color.black
    private let notSelectedColor = Color.gray

    @Binding private var countryISOCode: String

    @State private var showCountryPicker = false

    private var selectedCountry: Country {
        NSLocale.countries.first { country in
            country.code == countryISOCode
        } ?? Country.countryNotSelected
    }

    private var textColor: Color {
        selectedCountry.name == Country.countryNotSelected.name ? notSelectedColor : selectedColor
    }

    public init(countryISOCode: Binding<String>) {
        self._countryISOCode = countryISOCode
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Text("Country")
                .bold()

            Button {
                showCountryPicker = true
            } label: {
                HStack {
                    CountryFlagAndNameView(country: selectedCountry)
                        .foregroundColor(textColor)

                    Spacer()

                    Image(systemName: "chevron.up.chevron.down")
                }
                .padding()
            }
            .border(selectedColor)
        }
        .foregroundColor(selectedColor)
        .sheet(isPresented: $showCountryPicker) {
            CountriesListView(countryISOCode: $countryISOCode)
        }
    }

}

struct CountryPicker_Previews: PreviewProvider {
    static var previews: some View {
        CountryPicker(countryISOCode: .constant("IN"))
            .padding(.all)
            .previewLayout(.sizeThatFits)
    }
}
