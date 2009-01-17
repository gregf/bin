#!/usr/bin/env ruby
# vim: set sw=2 sts=2 et tw=80 :

WALLPAPER="/home/gregf/.wallpaper/" # Full path no ~
IMAGE_FORMATS="[.jpg,.gif,.png.,bmp]" # Keep this a string
FEH="/usr/bin/feh"
FEH_OPTIONS="--bg-scale"

unless IMAGE_FORMATS.class == String
  puts "IMAGE_FORMATS must be a string, surround it in quotes."
  exit
end

unless File.directory?("#{WALLPAPER}")
  puts "Wallpaper directory #{WALLPAPER} does not exist"
  exit
end

unless File.executable?("/usr/bin/feh")
  puts "#{FEH} is not executable"
  exit
end

Dir.chdir("#{WALLPAPER}") do
  files = Dir.glob("*#{IMAGE_FORMATS}")
  random_file = rand(1-files.size).to_i
  IO.popen("#{FEH} #{FEH_OPTIONS} #{files[random_file]}")
end
