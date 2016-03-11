import Foundation
import Alamofire
import BrightFutures

import RealmSwift


class Payment {
    let senderId: String
    let recieverId: String
    let amount: Float
    let sentAt: NSDate
    
    init(senderId: String, recieverId: String, amount: Float, sentAt: NSDate) {
        self.senderId = senderId
        self.recieverId = recieverId
        self.amount = amount
        self.sentAt = sentAt
    }
}