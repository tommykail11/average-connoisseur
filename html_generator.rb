require "json"
require "open-uri"

class HtmlGenerator

	def show(id)
		print_header

		product = retrieve_data("http://lcboapi.com/products/#{id}.json")
		display_detailed_product(product)
		print_footer
	end

	def index
		print_header
		puts "<h1>All products</h1>"

		products = retrieve_data("http://lcboapi.com/products.json")

		products.each do |product|
			display_product(product)
		end

		print_footer
	
	end


	private # can't call private methods directly 

	def display_detailed_product(product)
		# generate show page content here
		puts "<div class='molson'><h3>#{product['name']}</h2>"
		puts "	<img src=#{product['image_url']}>"
		puts "	<ul style='list-style: none;'><li>id: #{product['id']}</li>"
		puts "		<li>#{product['producer_name']}</li>"
		puts "		<li>#{product['primary_category']}</li>"
		puts "		<li>#{product['secondary_category']}</li>"
		puts "		<li>#{product['origin']}</li>"
		puts "		<li>#{product['package_unit_volume_in_milliliters']} mL</li>"
		puts "		<li>#{product['volume_in_milliliters']} mL can</li>"
		puts "		<li>$#{product['price_in_cents']/100.0}</li>"
		puts "		<li>#{product['serving_suggestion']}</li>"
		puts "		<li>#{product['tasting_note']}</li>"
		puts "		<li>#{product['tags']}</li>
				</ul>
			</div>"
	end

	def display_product(product)
		puts "<div class='product'><h2>#{product['name']}</h2>"
		puts "	<img src=#{product['image_thumb_url']}>"
		puts "	<ul style='list-style: none;'><li>id: #{product['id']}</ll>"
		puts "		<li>#{product['producer_name']}</li>"
		puts "		<li>#{product['primary_category']}</li>"
		puts "		<li>#{product['secondary_category']}</li>"
		puts "		<li>#{product['package_unit_volume_in_milliliters']} ml</li>"
		puts "		<li>$#{product['price_in_cents']}</li>
				</ul>
			</div>"
	end

	def print_header
		puts "<html>"
		puts "	<head>"
		puts "		<title>Connoisseur</title>"
		puts "		<style>img {float: left;} .product{clear:both;}</style>"
		puts "	</head>"
		puts "	<body>"
		puts ""

	end

	def print_footer
		puts "	</body>"
		puts "</html>"
	end

	def retrieve_data(url)
		response = open(url).read
		data = JSON.parse(response)
		return data["result"]
	end
end
