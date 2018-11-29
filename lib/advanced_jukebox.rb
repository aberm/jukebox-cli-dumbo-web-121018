#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

my_songs = {
"Go Go GO" => '/home/lite-system-1868/jukebox-cli-dumbo-web-121018/audio/Emerald-Park/01.mp3',
"LiberTeens" => '/home/lite-system-1868/jukebox-cli-dumbo-web-121018/audio/Emerald-Park/02.mp3',
"Hamburg" =>  '/home/lite-system-1868/jukebox-cli-dumbo-web-121018/audio/Emerald-Park/03.mp3',
"Guiding Light" => '/home/lite-system-1868/jukebox-cli-dumbo-web-121018/audio/Emerald-Park/04.mp3',
"Wolf" => '/home/lite-system-1868/jukebox-cli-dumbo-web-121018/audio/Emerald-Park/05.mp3',
"Blue" => '/home/lite-system-1868/jukebox-cli-dumbo-web-121018/audio/Emerald-Park/06.mp3',
"Graduation Failed" => '/home/lite-system-1868/jukebox-cli-dumbo-web-121018/audio/Emerald-Park/07.mp3'
}

def help
  puts "I accept the following commands:
- help : displays this help message
- list : displays a list of songs you can play
- play : lets you choose a song to play
- exit : exits this program"
end



def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and 
  #list the songs by name
  my_songs.each do |key, value|
    puts key
  end
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  
  puts "Please enter a song name:"
  ans = gets.chomp
  if my_songs.keys.include?(ans)
    puts "Playing #{ans}"
    system "open #{my_songs[ans]}"
  else
    puts "Invalid input, please try again"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(my_songs)
  help
  
  answer = ""
  while answer != "exit"
    puts "Please enter a command:"
    answer = gets.chomp
    case answer
      when "list"
        list(my_songs)
      when "play"
        play(my_songs)
      when "help"
        help
      end
  end
  exit_jukebox
end
