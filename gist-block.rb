RUBY_ENGINE == 'opal' ? (require 'gist-block/extension') : (require_relative 'gist-block/extension')

Extensions.register :markup do
  block EmbeddedGistBlock 
end
