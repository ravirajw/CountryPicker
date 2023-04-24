//
//  CountryFlagAndNameView.swift
//  
//
//  Created by Raviraj Wadhwa on 24/04/23.
//

import SwiftUI

struct CountryFlagAndNameView: View {
    let country: Country

    var body: some View {
        HStack {
            if let flag = country.flag {
                Text(flag)
            }

            Text(country.name)
        }
    }
}

struct CountryFlagAndNameView_Previews: PreviewProvider {
    static var previews: some View {
        CountryFlagAndNameView(country: .countryNotSelected)
            .previewLayout(.sizeThatFits)
    }
}
