require 'mini_mime'
module MIME
  module Types
    # FROM -> ::MIME::Types[file.content_type].first.extensions.first
    # TO   -> MiniMime.lookup_by_content_type(file.content_type).extension
    def self.[](content_type)
      [OpenStruct.new(extensions: [MiniMime.lookup_by_content_type(content_type)&.extension].compact)]
    end

    # FROM -> ::MIME::Types.type_for(move_to).first.to_s
    # TO   -> ::MiniMime.lookup_by_filename(move_to).content_type
    def self.type_for(path)
      [::MiniMime.lookup_by_filename(path)&.content_type]
    end
  end

  # FROM -> MIME::Type.new("application/msword")
  # TO.  -> MiniMime.lookup_by_content_type("application/msword")
  class Type < SimpleDelegator
    def initialize(content_type)
      super(MiniMime.lookup_by_content_type(content_type))
    end

    def to_s
      __getobj__.content_type.to_s
    end
  end
end


