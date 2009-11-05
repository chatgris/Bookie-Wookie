# Install hook code here
puts "** Installing BookieWookie Plugin...." 

src = File.join(RAILS_ROOT, '/vendor/plugins/Bookie-Wookie/lib/bookie_wookie.yml')
config = File.join(RAILS_ROOT, '/config/bookie_wookie.yml')
puts "** Copying config file into #{config} ...." 
FileUtils.cp(src, config) unless File.exists? config


puts "** Done! " 
