//
//  EnumCaseItretable.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import Foundation
/// for removing the unknown case from caseetritable enum
protocol CaseEnumWithDefaultFirst: Codable & CaseIterable & RawRepresentable
where Self.RawValue == String, Self.AllCases: BidirectionalCollection { }

extension CaseEnumWithDefaultFirst {
    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? Self.allCases.first!
    }
}
