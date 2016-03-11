import Foundation
import Alamofire
import BrightFutures

let baseURL = NSURL(string: "http://172.20.9.144:8081")!

enum CustomerEndpoint {
    case ByDNI(String)
    
    func url() -> NSURL {
        switch self {
        case .ByDNI(let dni):
            return baseURL.URLByAppendingPathComponent("/api/customer/\(dni)")
        }
    }
}

class Customer {
    let name: String
    let surname: String
    let dni: String
    
    init(name: String, surname: String, dni: String) {
        self.name = name
        self.surname = surname;
        self.dni = dni;
    }
    
    // MARK: - API interaction Methods
    
    // MARK: - Customer API
    
    class func findByDni() {
        Alamofire.request(.GET, CustomerEndpoint.ByDNI("123").url())
            .responseJSON {response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }
    
    // MARK: - Payment API
    
    func getLastPayments(numberOfPayments: Int) -> Future<[Payment], AnyError> {
        return PaymentApi.lastPaymentsForCustomer(self.dni, numberOfPayments: numberOfPayments)
    }
}