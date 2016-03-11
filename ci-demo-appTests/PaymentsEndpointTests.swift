import XCTest

@testable import ci_demo_app

class PaymentsEndpointTests: XCTestCase {
    func testCreatePaymentsForCurstomerUrl() {
        let url = PaymentsEndpoint.paymentsForCustomer("1234567890").url();

        XCTAssertEqual(url.URLString, "http://172.20.9.144:8081/api/customer/1234567890/payments")
    }
}

