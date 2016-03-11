import Foundation
import Alamofire
import BrightFutures


public struct AnyError : ErrorType {
    public let cause:ErrorType
    
    public init(cause:ErrorType) {
        self.cause = cause
    }
}

public class PaymentApi {
    class func lastPaymentsForCustomer(customerDni: String, numberOfPayments: Int) -> Future<[Payment], AnyError> {
        return Future { completion in
            let url = PaymentsEndpoint.paymentsForCustomer(customerDni).url();
            Alamofire.request(.GET, url)
                .responseJSON { response in
                    print(response.result.value);
                    // completion(.Success(response.result.value));
            }
        }
    }
}