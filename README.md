# Terminal-Typing

## Game.swift
Change the paths in the functions playMusic() to the path of the songs you prefer.
````
    if genero == 1 {
                if dificuldade == 1{
                    playMusic("/Path/to/rock/song.mp3")
                }
                else if dificuldade == 2{
                    playMusic("Path/to/rock/song.mp3")
                }
                else if dificuldade == 3{
                    playMusic("Path/to/rock/song/faster/version.mp3")
                }
            } else if genero == 2 {
                if dificuldade == 1{
                    playMusic("/Path/to/pop/song.mp3")
                }
                else if dificuldade == 2{
                    playMusic("/Path/to/pop/song.mp3")
                }
                else if dificuldade == 3{
                    playMusic("/Path/to/pop/song/faster/version.mp3")
                }
                
            } else if genero == 3{
                if dificuldade == 1{
                    playMusic("/Path/to/hiphop/song.mp3")
                }
                else if dificuldade == 2{
                    playMusic("/Path/to/hiphop/song.mp3")
                }
                else if dificuldade == 3{
                    playMusic("/Path/to/hiphop/song/faster/version.mp3")
                }
            }
````


## How to play music with AVFoundation

First, import the AVFoundation library. Then declare an object of the AVAudioPlayer class that works as a player and a variable that contains the path to the audio file in the form of a URL. And inside a do-catch, try to open the audio file, initializing the object with the URL as a parameter and call the .play() function and show the error if the file is not found.

````
import AVFoundation
var audioPlayer: AVAudioPlayer?

let url = URL(fileURLWithPath: "/Path/to/file.mp3")
do {
    audioPlayer = try AVAudioPlayer(contentsOf: url)
    audioPlayer?.play()
} catch {
    print("Error: couldn't play song\n\(error.localizedDescription)")
}
````



