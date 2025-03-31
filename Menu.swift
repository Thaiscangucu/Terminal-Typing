import Foundation
import AVFoundation

var state : Bool = true
var mensagem = "Match the keys D, F, J and K in your keyboard with the ones that will come down on your screen before they cross the line."
let logo = """
▐▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▌
▐                                                                   ▌
▐ ████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗      ▌
▐ ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║      ▌
▐    ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║      ▌
▐    ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║      ▌
▐    ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗ ▌
▐    ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝ ▌
▐                                                                   ▌
▐ ████████╗██╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗                   ▌
▐ ╚══██╔══╝╚██╗ ██╔╝██╔══██╗██║████╗  ██║██╔════╝                   ▌
▐    ██║    ╚████╔╝ ██████╔╝██║██╔██╗ ██║██║  ███╗                  ▌
▐    ██║     ╚██╔╝  ██╔═══╝ ██║██║╚██╗██║██║   ██║                  ▌
▐    ██║      ██║   ██║     ██║██║ ╚████║╚██████╔╝                  ▌
▐    ╚═╝      ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝                   ▌
▐                                                                   ▌
▐▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▌
"""
let gameOverLogo = """
 ██████╗  █████╗ ███╗   ███╗███████╗     ██████╗ ██╗   ██╗███████╗██████╗ ██╗
██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔═══██╗██║   ██║██╔════╝██╔══██╗██║
██║  ███╗███████║██╔████╔██║█████╗      ██║   ██║██║   ██║█████╗  ██████╔╝██║
██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║   ██║╚██╗ ██╔╝██╔══╝  ██╔══██╗╚═╝
╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ╚██████╔╝ ╚████╔╝ ███████╗██║  ██║██╗
 ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝     ╚═════╝   ╚═══╝  ╚══════╝╚═╝  ╚═╝╚═╝
                                You lose!
                              
"""
let endGameLogo = """
███████╗███╗   ██╗██████╗      ██████╗  █████╗ ███╗   ███╗███████╗██╗
██╔════╝████╗  ██║██╔══██╗    ██╔════╝ ██╔══██╗████╗ ████║██╔════╝██║
█████╗  ██╔██╗ ██║██║  ██║    ██║  ███╗███████║██╔████╔██║█████╗  ██║
██╔══╝  ██║╚██╗██║██║  ██║    ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  ╚═╝
███████╗██║ ╚████║██████╔╝    ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗██╗
╚══════╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝
                        You finished the game!
                           
"""


// Função que mostra o menu, recebe o genero da musica e dificuldade do jogo.
func startMenu(){
    while(true) {
        menu()
        var entrada: String?
        repeat {
            print("\nType 'start' to start game or 'exit' to exit game: ", terminator: "")
            entrada = readLine()?.lowercased()
            if entrada == "exit" {
                print("Exiting game...")
                exit(0)
            }
            if entrada != "start" {
                print("❌ Invalid option! Try again.")
            }
    
        } while entrada != "start"
        let generoMusica: Int = songType()
        dificuldade = dificulty()
        if dificuldade == 4{
            startMenu()
        }
        verifyDificulty(dificuldade)
        beginGame(generoMusica)
    }
}

// Função que mostra o inicio do menu com o título e a descrição do jogo
func menu(){
    print("\u{001B}[4J")
    if(endGameVerify == 1){
        endGameVerify = 0
        endGame()
    }
    else if(gameOverVerify == 1){
        gameOverVerify = 0
        gameOver()
    }
    print("============================== Welcome to ===================================\n")
    print(logo)
    print("===============================================================================")
    print("                   Created by: Thais, João e Miqueias.                       \n")
    print(mensagem)
}

// Função que recebe o tipo da música que será tocada no jogo
func songType() -> Int {
    while(true){
        print("\nChoose a type of song:\n1 - Rock\n2 - Pop\n3 - Hip Hop")
        
        if let entrada = readLine(){
            switch entrada {
            case "1":
                print("🎸 You chose Rock!")
                return 1
            case "2":
                print("🎤 You chose Pop!")
                return 2
            case "3":
                print("🎤 You chose Hip Hop!")
                return 3
            default:
                print("❌ Invalid option! Choose 1, 2 or 3.")
            }
        }
    }
    return 0
}

// Função que recebe a dificuldade escolhida pro jogo
func dificulty() -> Int {
    print("\nChoose a dificulty: \n1 - Easy\n2 - Medium\n3 - Hard\n4 - Go Back")
    let entrada: String? = readLine()?.lowercased()
    if let entradaUnwrapped = entrada {
        switch entradaUnwrapped {
        case "1":
            print("You chose easy mode!")
            return 1
        case "2":
            print("You chose medium mode!")
            return 2
        case "3":
            print("You chose hard mode!")
            return 3
        case "4":
            return 4
        default:
            print("❌ Invalid option! Choose one of the options above.")
            dificulty()
        }
    }
    return 0
}

// Função que verifica qual dificuldade foi escolhida e retorna o intervalo de frames que definirá a velocidade do jogo
func verifyDificulty(_ dificuldade: Int){
    if dificuldade == 1{
        fps = 0.75
        return intervalo = 1/Double(fps)
    }
    if dificuldade == 2{
        fps = 1.0
        return intervalo = 1/Double(fps)
    }
    if dificuldade == 3{
        fps = 2.0
        return intervalo = 1/Double(fps)
    }
}

// Função que toca o arquivo de música,Recebe o path do arquivo como parâmetro
func playMusic(_ filePath: String) {
    let url = URL(fileURLWithPath: filePath) // Define o URL a partir desse path
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
    } catch {
        print("Error: couldn't play song \(error.localizedDescription)")// Se não conseguir mostra mensagem de erro
    }
}

func endGame(){
    print(endGameLogo)
    var entrada: String?
    repeat {
        print("\nType 'back' to go back to menu: ", terminator: "")
        entrada = readLine()?.lowercased()
        if entrada != "back" {
            print("❌ Invalid option! Try again.")
        }
    } while entrada != "back"
    
    menu()
}

func gameOver(){
    print(gameOverLogo)
    var entrada: String?
    repeat {
        print("\nType 'back' to go back to menu: ", terminator: "")
        entrada = readLine()?.lowercased()
        if entrada != "back" {
            print("❌ Invalid option! Try again.")
        }
    } while entrada != "back"
    menu()
}
