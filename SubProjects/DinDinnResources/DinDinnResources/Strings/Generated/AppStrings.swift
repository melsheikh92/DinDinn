// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum AppStrings {
    /* DinDinn */
    public static var appName: String {
        return AppStrings.tr("Strings", "app_name")
    }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension AppStrings {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        // swiftlint:disable:next nslocalizedstring_key
        let bundle = Bundle(for: LanguageManager.self)
        let format = NSLocalizedString(key, tableName: table, bundle: bundle, comment: "")
        var newFormat = format.replacingOccurrences(of: "%d", with: "%s")
        newFormat = newFormat.replacingOccurrences(of: "%s", with: "%@")
        newFormat = newFormat.replacingOccurrences(of: "%i", with: "%@")
        newFormat = newFormat.replacingOccurrences(of: "$d", with: "$s")
        newFormat = newFormat.replacingOccurrences(of: "$s", with: "$@")
        newFormat = newFormat.replacingOccurrences(of: "$i", with: "$@")
        let locale = Locale(identifier: LanguageManager.shared.currentLanguage.rawValue)
        return String(format: newFormat, locale: locale, arguments: args)
    }
    static func get(_ key: String) -> String? {
        let value = AppStrings.tr("Stirngs", key)
        guard value != key else { return nil }
        return value
    }
}
