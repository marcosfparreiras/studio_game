# Foundraising Program
# Dados baseados em https://wefunder.me/
require_relative 'fundrequest'
require_relative 'grant_project'
require_relative 'half_way_project'

# project1 = Project.new( 'parkav', 669, 700 );
# project2 = Project.new( 'plate iq', 654, 700 );
# project3 = Project.new( 'bagaveev', 1128, 1600 );
# project4 = Project.new( 'flaviar', 2912, 3400 );

fund_program1 = FundRequest.new("VC-Friendly Start-up Projects.")
fund_program1.load_projects(ARGV.shift || "projects.csv")

grant_project = GrantProject.new("grant", 200, 2030)
half_way_project = HalfWayProject.new("half way", 200, 4000)


fund_program1.add_project(grant_project)
fund_program1.add_project(half_way_project)

loop do
	puts "How many rounds? ('quit' to exit)"
	answer = STDIN.gets.chomp.downcase
	case answer
	when /^\d+$/
		puts "Enjoy the #{answer} rounds"
		fund_program1.request_funding(answer.to_i)
	when 'quit', 'exit'
		fund_program1.print_stats
		break
	end
end

fund_program1.save_under_funded_projects("under_fundeds_projects.txt")