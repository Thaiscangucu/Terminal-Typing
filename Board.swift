import Foundation

class Board{
    var matrixLogic: [[Character]]
    var matrixUser: [[Character]]
    var matrixReseted: [[Character]]
    var rows: Int = 10
    var columns: Int = 14
    
    init() {
        self.matrixLogic = [
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            ["-","-","-","-","-","-","-","-","-","-","-","-","-"," "]
            
        ]
        self.matrixUser = [
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            ["-","-","-","-","-","-","-","-","-","-","-","-","-"," "]
        ]
        self.matrixReseted = [
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
            ["-","-","-","-","-","-","-","-","-","-","-","-","-"," "]
        ]
    }
    
    func getMatrixAux(row: Int, column: Int) -> Character {
        return matrixUser[row][column]
    }
    
    func getMatrix(row: Int, column: Int) -> Character {
        return matrixLogic[row][column]
    }
    
    func addTop(){
        let numAleatorio = Int.random(in: 0..<4)
        switch numAleatorio{
        case 0:
            matrixLogic[0][0] = "D"
            matrixUser[0][0] = "D"
        case 1:
            matrixLogic[0][3] = "F"
            matrixLogic[0][3] = "F"
        case 2:
            matrixLogic[0][6] = "J"
            matrixLogic[0][6] = "J"
        case 3:
            matrixLogic[0][9] = "K"
            matrixLogic[0][9] = "K"
        default:
            print("número inválido!")
            
        }
    }
    func moveDown() {
        for row in stride(from: rows - 2, through: 0, by: -1) {
            for col in 0..<columns {
                matrixLogic[row + 1][col] = matrixLogic[row][col]
                matrixLogic[row][col] = " "
                copyMatrix()
            }
        }
        addTop()
        
    }
    
    func copyMatrix() -> [[Character]]{
        for row in 0..<rows {
            for col in 0..<columns {
                matrixUser[row][col] = matrixLogic[row][col]
            }
        }
        return matrixUser
    }
    
        
        func printBoard(){
            print("\u{001B}[2J")
            fputs("\u{1B}[3;32H", stdout)
            fputs("Score: \(score)", stdout)
//            fputs("\u{1B}[5;5H", stdout)
            for row in 0..<rows+1{
                for col in 0..<columns{
                    fputs("\u{1B}[\(row + 5);\(col + 30)H", stdout)
                    fputs(String(matrixUser[row][col]), stdout)
                }
            }
            fflush(__stdoutp)
        }
    }
