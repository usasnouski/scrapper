require 'open-uri'
require 'nokogiri'

class Api::PagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @pages = Page.all
  end

  def create
    @url = params[:url]
    doc = validate_url

    if doc.nil?
      render json: "Invalid URL", status: 500
      return
    end

    content = extract_content(doc)
    @page = Page.new(url: @url, content: content)

    if @page.save
      render json: @page
    else
      render json: @page.errors.full_messages, status: 422
    end
  end

  private

  def validate_url
    begin
      Nokogiri::HTML(open(@url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
    rescue
      nil
    end
  end

  def extract_content(doc)
    tags = ['h1', 'h2', 'h3', 'a']
    content = Hash.new { |h, k| h[k] = [] }

    tags.each do |tag|
      doc.css(tag).each do |el|
        content[tag] << (tag === 'a' ? el['href'] : el.text)
      end
    end

    content
  end
end
