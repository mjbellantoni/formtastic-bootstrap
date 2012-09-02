# encoding: utf-8
require 'spec_helper'

describe 'time select input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything
  end

  describe "general" do
    before do
      ::I18n.backend.reload!
      output_buffer.replace ''
    end

    describe "with :ignore_date => true" do
      before do
        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.input(:publish_at, :as => :time_select, :ignore_date => true))
        end)
      end

      it 'should not have hidden inputs for day, month and year' do
        output_buffer.should_not have_tag('input#post_publish_at_1i')
        output_buffer.should_not have_tag('input#post_publish_at_2i')
        output_buffer.should_not have_tag('input#post_publish_at_3i')
      end

      it 'should have an input for hour and minute' do
        output_buffer.should have_tag('select#post_publish_at_4i')
        output_buffer.should have_tag('select#post_publish_at_5i')
      end

    end
    
    describe "with :ignore_date => false" do
      before do
        @new_post.stub(:publish_at).and_return(Time.parse('2010-11-07'))
        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.input(:publish_at, :as => :time_select, :ignore_date => false))
        end)
      end

      it 'should have a hidden input for day, month and year' do
        output_buffer.should have_tag('input#post_publish_at_1i')
        output_buffer.should have_tag('input#post_publish_at_2i')
        output_buffer.should have_tag('input#post_publish_at_3i')
        output_buffer.should have_tag('input#post_publish_at_1i[@value="2010"]')
        output_buffer.should have_tag('input#post_publish_at_2i[@value="11"]')
        output_buffer.should have_tag('input#post_publish_at_3i[@value="7"]')
      end

      it 'should have an select for hour and minute' do
        output_buffer.should have_tag('select#post_publish_at_4i')
        output_buffer.should have_tag('select#post_publish_at_5i')
      end

    end

    describe "with :ignore_date => false and no initial Time" do
      before do
        @new_post.stub(:publish_at)
        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.input(:publish_at, :as => :time_select, :ignore_date => false))
        end)
      end

      it 'should have a hidden input for day, month and year' do
        output_buffer.should have_tag('input#post_publish_at_1i')
        output_buffer.should have_tag('input#post_publish_at_2i')
        output_buffer.should have_tag('input#post_publish_at_3i')
      end

      it 'should not have values in hidden inputs for day, month and year' do
        output_buffer.should have_tag('input#post_publish_at_1i[@value=""]')
        output_buffer.should have_tag('input#post_publish_at_2i[@value=""]')
        output_buffer.should have_tag('input#post_publish_at_3i[@value=""]')
      end

      it 'should have an select for hour and minute' do
        output_buffer.should have_tag('select#post_publish_at_4i')
        output_buffer.should have_tag('select#post_publish_at_5i')
      end

    end

    describe "without seconds" do
      before do
        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.input(:publish_at, :as => :time_select))
        end)
      end

      it_should_have_bootstrap_horizontal_wrapping
      it_should_have_input_wrapper_with_class("time_select")
      it_should_have_input_wrapper_with_class(:input)
      it_should_have_input_wrapper_with_id("post_publish_at_input")
      it_should_apply_error_logic_for_input_type(:time_select)

      it 'should have a legend and label with the label text inside the fieldset' do
        output_buffer.should have_tag('form div.control-group.time_select label.control-label', /Publish at/)
      end

      it 'should have two selects for hour and minute' do
        output_buffer.should have_tag('form div.control-group.time_select div.controls select', :count => 2)
      end
    end

    describe "with seconds" do
      before do
        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.input(:publish_at, :as => :time_select, :include_seconds => true))
        end)
      end

      it 'should have three selects for hour, minute and seconds' do
        output_buffer.should have_tag('form div.control-group.time_select div.controls select', :count => 3)
      end
    end
  end

  describe ':labels option' do
    it "should provide a message that :labels is not supported" do
      pending ':labels is not supported'
    end
  end

  describe ':namespace option' do
    before do
      concat(semantic_form_for(@new_post, :namespace => 'form2') do |builder|
        concat(builder.input(:publish_at, :as => :time_select))
      end)
    end

    it 'should have a tag matching the namespace' do
      output_buffer.should have_tag('#form2_post_publish_at_input')
      output_buffer.should have_tag('#form2_post_publish_at_4i')
      output_buffer.should have_tag('#form2_post_publish_at_5i')
    end
  end
  
  describe "when required" do
    it "should add the required attribute to the input's html options" do
      with_config :use_required_attribute, true do 
        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.input(:title, :as => :time_select, :required => true))
        end)
        output_buffer.should have_tag("select[@required]", :count => 2)
      end
    end
  end
  
  describe "when index is provided" do

    before do
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.fields_for(:author, :index => 3) do |author|
          concat(author.input(:created_at, :as => :time_select))
        end)
      end)
    end

    it 'should index the id of the control-group' do
      output_buffer.should have_tag("div.control-group#post_author_attributes_3_created_at_input")
    end

    it 'should index the id of the select tag' do
      output_buffer.should have_tag("input#post_author_attributes_3_created_at_1i")
      output_buffer.should have_tag("input#post_author_attributes_3_created_at_2i")
      output_buffer.should have_tag("input#post_author_attributes_3_created_at_3i")
      output_buffer.should have_tag("select#post_author_attributes_3_created_at_4i")
      output_buffer.should have_tag("select#post_author_attributes_3_created_at_5i")
    end

    it 'should index the name of the select tag' do
      output_buffer.should have_tag("input[@name='post[author_attributes][3][created_at(1i)]']")
      output_buffer.should have_tag("input[@name='post[author_attributes][3][created_at(2i)]']")
      output_buffer.should have_tag("input[@name='post[author_attributes][3][created_at(3i)]']")
      output_buffer.should have_tag("select[@name='post[author_attributes][3][created_at(4i)]']")
      output_buffer.should have_tag("select[@name='post[author_attributes][3][created_at(5i)]']")
    end

  end
  
end



