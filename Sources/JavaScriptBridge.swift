//
//  JavaScriptBridge.swift
//  RRuleSwift
//
//  Created by Xin Hong on 16/3/28.
//  Copyright © 2016年 Teambition. All rights reserved.
//

import Foundation
import EventKit

internal struct JavaScriptBridge {
    
    // This class is needed to be able to get out bundle
    private class DummyClass {}
    
    internal static func rrulejs() -> String? {
        let libPath = Bundle(for: DummyClass.self).path(forResource: "RRuleSwift.bundle", ofType: "js") ?? Bundle.main.path(forResource: "RRuleSwift.bundle", ofType: "js")
        guard let rrulelibPath = libPath else {
            return nil
        }

        do {
            return try String(contentsOfFile: rrulelibPath)
        } catch _ {
            return nil
        }
    }
}

internal extension RecurrenceFrequency {
    fileprivate func toJSONFrequency() -> String {
        switch self {
        case .secondly: return "RRule.SECONDLY"
        case .minutely: return "RRule.MINUTELY"
        case .hourly: return "RRule.HOURLY"
        case .daily: return "RRule.DAILY"
        case .weekly: return "RRule.WEEKLY"
        case .monthly: return "RRule.MONTHLY"
        case .yearly: return "RRule.YEARLY"
        }
    }
}

internal extension EKWeekday {
    fileprivate func toJSONSymbol() -> String {
        switch self {
        case .monday: return "RRule.MO"
        case .tuesday: return "RRule.TU"
        case .wednesday: return "RRule.WE"
        case .thursday: return "RRule.TH"
        case .friday: return "RRule.FR"
        case .saturday: return "RRule.SA"
        case .sunday: return "RRule.SU"
        }
    }
}
