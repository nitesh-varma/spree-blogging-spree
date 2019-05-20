class Spree::BlogEntryImage < Spree::Image

 def self.styles
    @styles ||= {
      mini: '48x48>',
      small: '120x100>',
      product: '360x288>',
      large: '1000x800>'
    }
  end

end
