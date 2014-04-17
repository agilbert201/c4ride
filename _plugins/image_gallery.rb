module Jekyll

  # Naive image gallery generator. Assumes assets are in dest dir for site,
  # and that corresponding thumbnails are in a subdir Thumbs.
  # Example:
  #    {% gallery assets/photos/2013 %}
  class GalleryTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
      Jekyll.logger.info "GalleryTag initialize"
    end

    def render(context)
      @config = context.registers[:site].config['gallerytag']
      Jekyll.logger.info "GalleryTag render"
      images_html = ""
      images = [ { "url" => "foo.jpg", "thumbnail" => "Thumbs/foo.jpg" } ]
      images.each_with_index do |image, key|
        images_html << "<a href=\"#{image['url']}\" data-gallery>\n"
        images_html << "  <img src=\"#{image['thumbnail']}\">\n"
        images_html << "</a>\n"
      end
      return images_html
    end

  end
end

Liquid::Template.register_tag('gallery', Jekyll::GalleryTag)