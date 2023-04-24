//
//  Country.swift
//  
//
//  Created by Raviraj Wadhwa on 24/04/23.
//

import Foundation

public struct Country: Identifiable {
    public let id = UUID()
    public let code: String
    public let flag: String?
    public let name: String

    public init(
        code: String,
        flag: String?,
        name: String
    ) {
        self.code = code
        self.flag = flag
        self.name = name
    }

    public static let countryNotSelected = Country(
        code: "Not selected",
        flag: nil,
        name: "Not selected"
    )
}
