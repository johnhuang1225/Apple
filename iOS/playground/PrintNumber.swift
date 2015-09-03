
var numArr = [
                [0,0,1,1,1,0,0],
                [0,1,1,0,1,1,0],
                [1,1,0,0,0,1,1],
                [1,1,0,0,0,1,1],
                [1,1,0,0,0,1,1],
                [1,1,0,0,0,1,1],
                [1,1,0,0,0,1,1],
                [1,1,0,0,0,1,1],
                [0,1,1,0,1,1,0],
                [0,0,1,1,1,0,0]
            ]

for var row = 0; row < numArr.count; row++ {
    var str = String()
    for var col = 0; col < numArr[row].count; col++ {
        var symbol = " "
        if numArr[row][col] == 1 {
            symbol = "*"
        }
        str += symbol
    }
    println(str)
}