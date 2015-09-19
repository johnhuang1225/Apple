
enum MyError: ErrorType {
    case UserError(message: String)
    case NetworkError
    case DiscoverydError
}


func doStuff(number: Int) throws -> Int {
    if number == 556 {
        throw MyError.UserError(message: "556 number is not allow")
    }
    return number * number
}

func whatsNew() {
    do {
        let result = try doStuff(556)
        print("result:\(result)")
    } catch MyError.UserError(let errorMessage) {
        print("The error is:\(errorMessage)")
    } catch MyError.NetworkError {
        print("MyError.NetworkError")
    } catch MyError.DiscoverydError {
        print("My Error.NewworkError")
    } catch {
        print("Other Error")
    }
}

whatsNew()
