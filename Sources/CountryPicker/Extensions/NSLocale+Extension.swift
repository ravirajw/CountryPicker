//
//  Extensions.swift
//  
//
//  Created by Raviraj Wadhwa on 24/04/23.
//

import Foundation

extension NSLocale {

    static let countries = getAllCountriesWithNone()

    static func getAllCountriesWithNone() -> [Country] {
        if var countries = allCountries() {
            countries.insert(Country.countryNotSelected, at: 0)
            return countries
        }
        return [Country.countryNotSelected]
    }

    static func allCountries() -> [Country]? {
        var countries: [Country]?

        for isoCountryCode in self.isoCountryCodes {
            if let countryName = isoCountryCode.countryName {
                let country = Country(
                    code: isoCountryCode,
                    flag: isoCountryCode.countryFlag,
                    name: countryName
                )

                if countries == nil {
                    countries = [Country]()
                }
                countries!.append(country)
            }
        }

        countries?.sort { $0.name < $1.name }
        return countries
    }

}
