module Payday
  class PrawnTtfDocument < Prawn::Document
    @@fonts_status = nil

    def initialize(*args)
      super
      font_setup
    end

    def self.fonts_status
      @@fonts_status
    end

    def font_setup
      begin
        fonts_path = File.join(File.dirname(__FILE__), "..", "..", "lib", "assets", "fonts")
        self.font_families.update("OpenSans" => {
         :normal => File.join(fonts_path,"OpenSans-Regular.ttf"),
         :italic => File.join(fonts_path,"OpenSans-Italic.ttf"),
         :bold => File.join(fonts_path,"OpenSans-Bold.ttf"),
         :bold_italic => File.join(fonts_path,"OpenSans-Bold-Italic.ttf")
        })
        font("OpenSans")
        @@fonts_status ||= 'ttf'
      rescue  => e
        @@fonts_status ||= 'default'
      end

    end
  end
end


