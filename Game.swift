import Foundation

// Função que começa o jogo depois de definir as características da partida
func beginGame(_ genero: Int) {
    while(state){
        print()
        print("Type 'start' to start game...")
        let entrada: String? = readLine()
        if let entradaUnwrapped = entrada, entradaUnwrapped.lowercased() == "start" {
            for i in (1...3).reversed() {
                sleep(1)
                print(i)
                print("\n")
            }
            sleep(1)
            print("GO!")
            
            if genero == 1 {
                if dificuldade == 1{
                    playMusic("/Users/tatacangucu/Downloads/Sweet Child O Mine - short version.mp3")
                }
                else if dificuldade == 2{
                    playMusic("/Users/tatacangucu/Downloads/Sweet Child O Mine - short version.mp3")
                }
                else if dificuldade == 3{
                    playMusic("/Users/tatacangucu/Downloads/Sweet Child O Mine - 2x speed.mp3")
                }
            } else if genero == 2 {
                if dificuldade == 1{
                    playMusic("/Users/tatacangucu/Music/Music/Media.localized/Music/Unknown Artist/Unknown Album/Shake It Off - short version.mp3")
                }
                else if dificuldade == 2{
                    playMusic("/Users/tatacangucu/Music/Music/Media.localized/Music/Unknown Artist/Unknown Album/Shake It Off - short version.mp3")
                }
                else if dificuldade == 3{
                    playMusic("/Users/tatacangucu/Downloads/Shake It Off - 2x speed.mp3")
                }
                
            } else if genero == 3{
                if dificuldade == 1{
                    playMusic("/Users/tatacangucu/Downloads/Not Like Us - short version.mp3")
                }
                else if dificuldade == 2{
                    playMusic("/Users/tatacangucu/Downloads/Not Like Us - short version.mp3")
                }
                else if dificuldade == 3{
                    playMusic("/Users/tatacangucu/Downloads/Not Like Us - 2x speed.mp3")
                }
            }
            setNonBlockingMode()
            game()
            board.matrixLogic = board.matrixReseted// Começa o jogo
            score = 0
            if(endGameVerify == 0){
                gameOverVerify = 1
                break
            }
            
            else{
                break
            }
        }
        else if let entradaUnwrapped = entrada, entradaUnwrapped != "start"{
            print("❌ Invalid option! Try again.")
        }
    }
}

// Muda as flags do terminal para não block para que não bloqueie
func setNonBlockingMode(){
    let flags = fcntl(STDIN_FILENO, F_GETFL)
    fcntl(STDIN_FILENO, F_SETFL, flags | O_NONBLOCK)
}

func setNonBlockingModeFalse(){
    let flags = fcntl(STDIN_FILENO, F_GETFL)
    fcntl(STDIN_FILENO, F_SETFL, ~(flags))
}

func game() {
    board.addTop() // Adiciona letra na matriz
    board.printBoard()
    while true {
        let starTime = Date()  // Pega o horário que esse bloco inicia
        if let key = getKeyPress(){  // Recebe uma entrada de tecla
            // Verificação se o usuário acertou ou errou
            if key.uppercased() == "D" && board.getMatrix(row: 9, column: 0) != "D" {
                audioPlayer?.stop()
                break
            }
            else if key.uppercased() == "D" && board.getMatrix(row: 9, column: 0) == "D" {
                score += 1
                continue
            }
            else if key.uppercased() == "F" && board.getMatrix(row: 9, column: 3) != "F"{
                audioPlayer?.stop()
                break
            }
            else if key.uppercased() == "F" && board.getMatrix(row: 9, column: 3) == "F"{
                score += 1
                continue
            }
            else if key.uppercased() == "J" && board.getMatrix(row: 9, column: 6) != "J"{
                audioPlayer?.stop()
                break
            }
            else if key.uppercased() == "J" && board.getMatrix(row: 9, column: 6) == "J"{
                score += 1
                continue
            }
            else if key.uppercased() == "K" && board.getMatrix(row: 9, column: 9) != "K"{
                audioPlayer?.stop()
                break
            }
            else if key.uppercased() == "K" && board.getMatrix(row: 9, column: 9) == "K"{
                score += 1
                continue
            }
        }
        board.moveDown()  // Move a letra pra baixo na matriz
        board.printBoard()  // Imprime a matriz
        let endTime = Date() // Pega o horário que o bloco termina
        let elapsedTimeFPS = endTime.timeIntervalSince(starTime)
        let waitTime = max(0,intervalo-elapsedTimeFPS)
        usleep(UInt32(waitTime * 1_000_000))
        if(audioPlayer?.isPlaying == false){
            endGameVerify = 1
            break
        }
    }
    setNonBlockingModeFalse()
    
}


// Define as configurações do terminal para buffer e eco para off, ou seja recebe comandos sem apertar enter e não aparecer a letra na tela quando pressionada
func setRawMode(_ enable: Bool) {
    var term = termios()
    tcgetattr(STDIN_FILENO, &term) // Obtém configurações atuais do terminal
    
    if enable {
        term.c_lflag &= ~tcflag_t(ICANON | ECHO) // Desativa buffer e eco
    } else {
        term.c_lflag |= tcflag_t(ICANON | ECHO)  // Restaura configurações
    }
    tcsetattr(STDIN_FILENO, TCSANOW, &term) // Aplica mudanças
}

// Função que recebe um comando de uma tecla no terminal
func getKeyPress() -> Character? {
    setRawMode(true) // Ativa o modo cru (sem Enter)
    let key = getchar() // Recebe o comando
    setRawMode(false)  // Desativa o modo cru (sem Enter)
    return key > 0 ? Character(UnicodeScalar(UInt8(key))) : nil // Retorna a tecla pressionada
}

