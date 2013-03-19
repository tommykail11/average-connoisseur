require_relative 'html_generator'

# Access parameters passed into the app
if ARGV.empty? # there are no arguments provided
	puts "USAGE: There are no arguments."
else
	#puts "There are some arguments passed in."
	generator = HtmlGenerator.new
	if ARGV[0] == "index"
		generator.index
	elsif ARGV[0] == "show"
		id = ARGV[1]
		generator.show(id)
	else
		puts "Unrecognized action. Please refer back to USAGE."
	end
end
