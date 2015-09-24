/**
 * https://medium.com/swift-programming/lets-try-swift-version-swift-2-9a90cd738d53
 */

enum CustomError: ErrorType {
	case InvalidUsername(message: String)
	case ErrorWithMessage(message: String)
}

let invalidUsernameArray = ["root", "dog", "cat"]

func loginUserWithName(username: String?) throws-> String {
	guard let username1 = username where !invalidUsernameArray.contains(username1) else {
		throw CustomError.InvalidUsername(message: "錯誤的使用者名稱!!")
	} 

	guard let username2 = username where username2.characters.count != 0 else {
		throw CustomError.ErrorWithMessage(message: "沒有輸入姓名")
	}
	return "token: " + username2
}

func login() {
	do {
		let token = try loginUserWithName("root")
		print("user logged in \(token)")
	} catch CustomError.InvalidUsername(let message) {
		print("An InvalidUsername occurred: \(message)")
	} catch CustomError.ErrorWithMessage(let messge) {
		print("An ErrorWithMessage occurred: \(messge)")
	} catch {

	}
}

login()




