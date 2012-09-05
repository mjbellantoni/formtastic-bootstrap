module FbCustomMacros

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def it_should_have_bootstrap_horizontal_wrapping
      it "should have 'input' class in the right place" do
        output_buffer.should have_tag("form div.control-group div.controls")
      end
    end

    def it_should_have_bootstrap_controls_label_with(class_name)
      it "should have bootstrap controls wrapper with class '#{class_name}'" do
        output_buffer.should have_tag("form div.controls label.#{class_name}")
      end
    end
    
  end
  
end