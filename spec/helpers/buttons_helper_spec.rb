# encoding: utf-8
require 'spec_helper'

describe 'Formtastic::FormBuilder#buttons' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything
    Formtastic::Helpers::FormHelper.builder = FormtasticBootstrap::FormBuilder
  end

  describe 'with a block' do
    describe 'when no options are provided' do
      before do
        concat(semantic_form_for(@new_post) do |builder|
          buttons = builder.buttons do
            concat('hello')
          end
          concat(buttons)
        end)
      end

      it 'should render a div inside the form, with a class of "form-actions"' do
        output_buffer.should have_tag("form div.form-actions")
      end

      it 'should not render an ol inside the div' do
        output_buffer.should_not have_tag("form div.form-actions ol")
      end

      it 'should render the contents of the block inside the input' do
        output_buffer.should have_tag("form div.form-actions", /hello/)
      end

      it 'should not render a legend inside the div' do
        output_buffer.should_not have_tag("form div.form-actions legend")
      end
    end

    describe 'when other options are provided' do
      before do
        @id_option = 'advanced'
        @class_option = 'wide'

        concat(semantic_form_for(@new_post) do |builder|
          builder.buttons :id => @id_option, :class => @class_option do
          end
        end)
      end
      it 'should pass the options into the div tag as attributes' do
        output_buffer.should have_tag("form div##{@id_option}")
        output_buffer.should have_tag("form div.#{@class_option}")
      end
    end

  end

  describe 'without a block' do

    describe 'with no args (default buttons)' do

      before do
        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.buttons)
        end)
      end

      it 'should render a form' do
        output_buffer.should have_tag('form')
      end

      it 'should render a "form-actions" div inside the form' do
        output_buffer.should have_tag('form div.form-actions')
      end

      it 'should not render a legend in the div' do
        output_buffer.should_not have_tag('form div.form-actions legend')
      end

      it 'should render an button item in the ol for each default button' do
        output_buffer.should have_tag('form div.form-actions input.btn', :count => 1)
      end

      it 'should render a commit list item for the commit button' do
        output_buffer.should have_tag('form div.form-actions input.commit')
      end

    end

    describe 'with button names as args' do

      before do
        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.buttons(:commit))
        end)
      end

      it 'should render a form with a div containing an input for each button arg' do
        output_buffer.should have_tag('form > div.form-actions > input', :count => 1)
        output_buffer.should have_tag('form > div.form-actions > input.commit')
      end

    end

    describe 'with :names' do

      before do
        ActiveSupport::Deprecation.should_receive(:warn)
        concat(
          semantic_form_for(@new_post) do |builder|
            concat(builder.buttons(:commit, :name => "Now click a button"))
          end
        )
      end

      it 'should warn that \':name\' is not supported' do
        # Assertion is above in the before block.
      end

    end


    describe 'with button names and an options hash' do

      before do
        concat(
          semantic_form_for(@new_post) do |builder|
            concat(builder.buttons(:commit, :id => "my-id"))
          end
        )
      end

      it 'should render a form with a div containing a input for each button arg' do
        output_buffer.should have_tag('form > div.form-actions > input', :count => 1)
        output_buffer.should have_tag('form > div.form-actions > input.commit', :count => 1)
      end

      it 'should pass the options down to the div' do
        output_buffer.should have_tag('form > div#my-id.form-actions')
      end

    end

  end

end

