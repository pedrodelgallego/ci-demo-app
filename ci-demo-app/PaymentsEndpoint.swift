import Foundation

let paymentsBaseURL = NSURL(string: "http://172.20.9.144:8081")!

enum PaymentsEndpoint {
    case paymentsForCustomer(String)
    
    func url() -> NSURL {
        switch self {
        case .paymentsForCustomer(let dni):
            return paymentsBaseURL.URLByAppendingPathComponent("/api/customer/\(dni)/payments")
        }
    }
}
