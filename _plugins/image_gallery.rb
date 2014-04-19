module Jekyll

  # Naive image gallery generator. Assumes assets are in dest for site,
  # under path provided and that thumbs are in a subdir 'Thumbs'.
  # Example:
  #    {% gallery assets/photos/2013 %}
  class GalleryTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
      @config = context.registers[:site].config['gallerytag']
      basePath = @markup.strip
      photosPath = File.join(context.registers[:site].dest, basePath)
      Jekyll.logger.info "photosPath #{photosPath}"
      images = Dir.entries(photosPath).select {|f| !File.directory?(File.join(photosPath, f))}
      #Jekyll.logger.info Dir.entries(context.registers[:site].dest + "/assets/photos/2013")
      images_html = ""
      images.each do |image|
        photoPath = "/#{basePath}/#{image}"
        thumbPath = "/#{basePath}/Thumbs/#{image}"
        images_html << "<a href=\"#{photoPath}\" data-gallery>\n"
        images_html << "  <img src=\"#{thumbPath}\">\n"
        images_html << "</a>\n"
      end
      return images_html
    end

  end
end

Liquid::Template.register_tag('gallery', Jekyll::GalleryTag)