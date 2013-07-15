require 'spec_helper'

describe "wrapped input" do
  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything

    concat(semantic_form_for(@new_post) do |builder|
      concat(builder.input(:body, {:as => :text}.merge(options) ))
    end)
  end

  describe "text add ons" do
    context "when appened with append option" do
      let(:options) { { :append => "text appended in add-on"} }

      it "should have the appended text to the input in an add-on span" do
        output_buffer.should have_tag("form div.input-append span.add-on", "text appended in add-on")
        output_buffer.should_not have_tag("form div.input-prepend")
      end
    end

    context "when prepended with prepend option" do
      let(:options) { { :prepend => "text prepended in add-on"} }

      it "should have the prepended text to the input in an add-on span" do
        output_buffer.should have_tag("form div.input-prepend span.add-on", "text prepended in add-on")
        output_buffer.should_not have_tag("form div.input-append")
      end
    end

    context "when prepended and appened with prepend and append options" do
      let(:options) { { :prepend => "text prepended in add-on", :append => "text appended in add-on"} }

      it "should have the prepended text to the input in an add-on span" do
        output_buffer.should have_tag("form div.input-append span.add-on", "text appended in add-on")
        output_buffer.should have_tag("form div.input-prepend span.add-on", "text prepended in add-on")
      end
    end
  end

  describe "content add ons" do
    context "when appended with append_content option" do
      let(:options) { { :append_content => content_tag(:a, "button appended", :class => "btn")} }

      it "should have the appended text to the input in an add-on span" do
        output_buffer.should have_tag("form div.input-append a.btn", "button appended")
        output_buffer.should_not have_tag("form div.input-append span.add-on")
      end
    end

    context "when prepended with prepend_content option" do
      let(:options) { { :prepend_content => content_tag(:a, "button prepended", :class => "btn")} }

      it "should have the prepended text to the input in an add-on span" do
        output_buffer.should have_tag("form div.input-prepend a.btn", "button prepended")
        output_buffer.should_not have_tag("form div.input-prepend span.add-on")
      end
    end

    context "when prepended and appened with prepend and append options" do
      let(:options) { { :prepend_content => content_tag(:a, "button prepended", :class => "btn"), :append_content => content_tag(:a, "button appended", :class => "btn")} }

      it "should have the prepended text to the input in an add-on span" do
        output_buffer.should have_tag("form div.input-prepend a.btn", "button prepended")
        output_buffer.should have_tag("form div.input-append a.btn", "button appended")
      end
    end

  end
end
