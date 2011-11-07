require 'action_view/helpers/form_tag_helper'

module ActionView
  module Helpers

    module TextFieldDateHelper

      # These two handle an object with a method that returns a Date or Time object.
      def date_text_field(object_name, method, options = {}, html_options = {})
        InstanceTag.new(object_name, method, self, options.delete(:object)).to_date_text_field_tag(options, html_options)
      end

      def time_text_field(object_name, method, options = {}, html_options = {})
        InstanceTag.new(object_name, method, self, options.delete(:object)).to_time_text_field_tag(options, html_options)
      end

      # These two handle Date and Time objects.
      def text_field_date(date = Date.current, options = {}, html_options = {})
        DateTimeSelector.new(date, options, html_options).text_field_date
      end

      def text_field_time(time = Time.current, options = {}, html_options = {})
        DateTimeSelector.new(time, options, html_options).text_field_time
      end
    end

    class DateTimeSelector

      include ActionView::Helpers::FormTagHelper

      def text_field_date
        order = date_order.dup

        @options[:discard_hour]     = true
        @options[:discard_minute]   = true
        @options[:discard_second]   = true

        @options[:discard_year]   ||= true unless order.include?(:year)
        @options[:discard_month]  ||= true unless order.include?(:month)
        @options[:discard_day]    ||= true if @options[:discard_month] || !order.include?(:day)

        # Save this so we can restore it.
        original_datetime_separator_separator = @options[:datetime_separator] 
        original_date_separator = @options[:date_separator] 

        @options[:datetime_separator] = ""
        @options[:date_separator] = " "

        # If the day is hidden and the month is visible, the day should be set to the 1st so all month choices are
        # valid (otherwise it could be 31 and February wouldn't be a valid date)
        if @datetime && @options[:discard_day] && !@options[:discard_month]
          @datetime = @datetime.change(:day => 1)
        end

        [:day, :month, :year].each { |o| order.unshift(o) unless order.include?(o) }

        build_text_field_from_types(order).tap do
          # Restore.
          @options[:datetime_separator] = original_datetime_separator_separator
          @options[:date_separator] = original_date_separator
        end
      end

      def text_field_time
        order = []

        @options[:discard_month]    = true
        @options[:discard_year]     = true
        @options[:discard_day]      = true
        @options[:discard_second] ||= true unless @options[:include_seconds]

        # Save this so we can restore it.
        original_datetime_separator = @options[:datetime_separator]
        original_time_separator = @options[:time_separator] 
        original_date_separator = @options[:date_separator] 

        @options[:datetime_separator] = ''
        @options[:time_separator] = ':'
        @options[:date_separator] = " "

        order += [:year, :month, :day] unless @options[:ignore_date]

        order += [:hour, :minute]
        order << :second if @options[:include_seconds]

        build_text_field_from_types(order).tap do
          # Restore.
          @options[:datetime_separator] = original_datetime_separator 
          @options[:date_separator] = original_date_separator
          @options[:time_separator] = original_time_separator
        end
      end

      def text_field_second
        unless @options[:use_hidden] || @options[:discard_second]
          build_text(:second, sec)
        end
      end

      def text_field_minute
        unless @options[:use_hidden] || @options[:discard_minute]
          build_text(:minute, min)
        end
      end

      def text_field_hour
        unless @options[:use_hidden] || @options[:discard_hour]
          build_text(:hour, hour, :ampm => @options[:ampm])
        end
      end

      def text_field_day
        unless @options[:use_hidden] || @options[:discard_day]
          build_text(:day, day, :leading_zeros => false)
        end
      end

      def text_field_month
        unless @options[:use_hidden] || @options[:discard_month]
          build_text(:month, month.nil? ? "" : month_name(month), :leading_zeros => false)
        end
      end

      def text_field_year
        unless @options[:use_hidden] || @options[:discard_year]
          build_text(:year, year, :leading_zeros => false)
        end
      end

      def build_text_field_from_types(order)
        input = ''
        order.reverse.each do |type|
          separator = separator(type) unless type == order.first # don't add on last field
          input.insert(0, separator.to_s + send("text_field_#{type}").to_s) 
        end
        text_field_tag("", input.html_safe, @html_options).html_safe
      end

      def build_text(selected, value, options = {})
        unless value.nil?
          options.reverse_merge!({:leading_zeros => true, :ampm => false})
          leading_zeros = options.delete(:leading_zeros)
          value = leading_zeros ? sprintf("%02d", value) : value
          text = options[:ampm] ? AMPM_TRANSLATION[value] : value
        else
          ""
        end
      end

    end

    class InstanceTag #:nodoc:
      def to_date_text_field_tag(options = {}, html_options = {})
       datetime_selector(options, html_options).text_field_date.html_safe
      end

      def to_time_text_field_tag(options = {}, html_options = {})
       datetime_selector(options, html_options).text_field_time.html_safe
      end
    end

    autoload :TextFieldDateHelper
    include TextFieldDateHelper

  end
end