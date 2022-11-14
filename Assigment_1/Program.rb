require 'csv'
require './Seed'
require './Gene'
require './Hybrid'

#---------------------------UPLOAD FILES------------------------------
ALL_SEED = Seed.uploadfile(ARGV[1])
Gene.uploadfile(ARGV[0])
ALL_CROSS = Cross.uploadfile(ARGV[2])

puts()
#---------------------------PLANTING SEED-----------------------------
puts(".....................Planting module.......................")
ALL_SEED.each do |seed|
    seed.plant(7)
end

Seed.savechanges(ARGV[3])

puts()
#-----------------------------CROSSING---------------------------------
puts(".....................Genetically crossing module.......................")
ALL_CROSS.each do |gene|
    gene.chisquare
end
puts()
puts "FINAL REPORT:"
ALL_CROSS.each do |gene|
    gene.finalreport
end
puts()
puts('Thank you for using me! :)')

