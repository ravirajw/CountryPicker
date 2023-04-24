//
//  ContentView.swift
//  Example
//
//  Created by Raviraj Wadhwa on 24/04/23.
//

import SwiftUI
import CountryPicker

struct ContentView: View {

    @State var countryISOCode = Locale.current.regionCode ?? Country.countryNotSelected.code

    var body: some View {
        VStack {
            CountryPicker(initialCountryISOCode: $countryISOCode)
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
