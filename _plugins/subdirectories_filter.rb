module Jekyll
  module SubdirectoriesFilter
    def subdirectories(input)
      Dir.glob(File.join(input, '*')).select { |f| File.directory?(f) }
    end
    def file_list(input)
      Dir.glob(File.join(input, '*')).select { |f| File.file?(f) }.map { |f| File.basename(f) }
    end
  end
end

Liquid::Template.register_filter(Jekyll::SubdirectoriesFilter)