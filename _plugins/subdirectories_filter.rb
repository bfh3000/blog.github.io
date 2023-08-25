module Jekyll
  module SubdirectoriesFilter
    def subdirectories(input)
      Dir.glob(File.join(input, '*')).select { |f| File.directory?(f) }
    end
  end
end

Liquid::Template.register_filter(Jekyll::SubdirectoriesFilter)