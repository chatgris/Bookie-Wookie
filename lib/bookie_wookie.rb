module BookieWookie

  class BookieItem < Struct.new(:url, :title, :image)
  end

  def parse_bookie
    yml = YAML.load_file "#{RAILS_ROOT}/config/bookie_wookie.yml"
    items = []
 
    yml.each_key { |key|
      item        = BookieItem.new
      item.title = yml[key]['title']
      item.url = yml[key]['url']
      item.image = yml[key]['image']
      
      items << item }
    
    items.sort_by { |item| item.title }
  end

end

module BookieWookieHelper

  def render_bookie(permalink)
    items = @controller.parse_bookie
    
    output = "<ul class='social'>"
    
    items.each do |item|
      output << "<li><a href=\"#{item.url}#{CGI::escape(permalink)}\" title=\"Add to #{item.title.capitalize}\"><img src=\"#{item.image}\" alt=\"#{item.title}\" /></a></li>"
    end
 
    output << "</ul>"
  end
end
