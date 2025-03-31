import Foundation
import AVFoundation
import Darwin

let board = Board()
var fps = 0.0
var intervalo: Double
var score = 0
var gameOverVerify: Int = 0
var endGameVerify: Int = 0
var dificuldade: Int
var elapsedTimeMusic: TimeInterval
var audioPlayer: AVAudioPlayer?

startMenu()

// *Mudar o caminho dos arquivos das músicas no aba Game dentro das funções playMusic()*
