module Jekyll
  def subdirectories(input)
    # 주어진 디렉토리 내의 모든 파일과 디렉토리의 경로를 가져옴
    paths = Dir.glob(File.join(input, '*'))

    # 가져온 경로 중 디렉토리인 것만 필터링하여 반환
    subdirs = paths.select { |f| File.directory?(f) }

    # 디렉토리가 없으면 "00"을 반환
    subdirs.empty? ? ["00"] : subdirs
  end

  def fileList(input)
    Dir.glob(File.join(input, '*')).select { |f| File.file?(f) }.map { |f| File.basename(f) }
  end
end

Liquid::Template.register_filter(Jekyll)