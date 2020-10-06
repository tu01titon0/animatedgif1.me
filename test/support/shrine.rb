module TestData
  module_function

  def image_data
    attacher = Shrine::Attacher.new
    attacher.set(uploaded_image)
    attacher.column_data
  end

  def uploaded_image
    file = File.open("test/files/cat.gif", binmode: true)

    uploaded_file = Shrine.upload(file, :store, metadata: false)
    uploaded_file.metadata.merge!(
      "size"      => File.size(file.path),
      "mime_type" => "image/gif",
      "filename"  => "cat.gif",
    )

    uploaded_file
  end
end