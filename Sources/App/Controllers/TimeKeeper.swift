import Foundation

class TimeKeeper {
    func getSystemTime() -> String {
        let current = Date()
        return self.dateFormatter().string(from: current)
    }
    func dateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a '-' EEEE, dd MMMM y"
        formatter.timeZone = TimeZone(abbreviation: "AEDT")
        return formatter
    }
}
