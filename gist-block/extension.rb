require 'asciidoctor/extensions' unless RUBY_ENGINE == 'opal'
require 'gist'

include ::Asciidoctor

class EmbeddedGistBlock < Extensions::BlockProcessor
  use_dsl

  named :gist
  on_context :open
  parse_content_as :raw

  def process parent, reader, attrs
    document = parent.document
    lines = reader.lines
    options = {}

    if attrs.has_key? "filename"
      options[:filename] = attrs["filename"]
    end
    response = Gist.gist(lines.join("\n"), options)
 
    html = %(<script src="#{response["html_url"]}.js"></script>)

    create_pass_block parent, html, attrs, subs: nil
  end
end


