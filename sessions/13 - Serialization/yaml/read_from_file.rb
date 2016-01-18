load './classes.rb'

loaded_file = File.read('./yaml_dump.yml')

ap '============================================='
ap 'Loaded file:'
ap loaded_file
ap "It's class is: '#{loaded_file.class}'"
ap '============================================='

structured = YAML::load loaded_file

p ''

ap '============================================='
ap 'Structured:'
ap structured.body
ap "By #{structured.author.name}"
ap "It's class is: '#{structured.class}'"
ap '============================================='
