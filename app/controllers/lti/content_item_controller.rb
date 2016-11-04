class Lti::ContentItemController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :check_is_content_item, only: [:content_item]

  def content_item
    @return_url = params[:content_item_return_url]
    if params[:accept_media_types] =~ %r{text/html}
      @return_type = 'iframe'
    else
      @return_type = 'lti_launch'
    end
    @choruses = Chorus.all
    render 'lti/content_item'
  end

  def config_xml
    url = request.scheme + "://" + request.host_with_port + "/content_item"

    render xml: <<XML
<?xml version="1.0" encoding="UTF-8"?>
<cartridge_basiclti_link xmlns="http://www.imsglobal.org/xsd/imslticc_v1p0" xmlns:blti="http://www.imsglobal.org/xsd/imsbasiclti_v1p0" xmlns:lticm="http://www.imsglobal.org/xsd/imslticm_v1p0" xmlns:lticp="http://www.imsglobal.org/xsd/imslticp_v1p0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.imsglobal.org/xsd/imslticc_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imslticc_v1p0.xsd http://www.imsglobal.org/xsd/imsbasiclti_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imsbasiclti_v1p0p1.xsd http://www.imsglobal.org/xsd/imslticm_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imslticm_v1p0.xsd http://www.imsglobal.org/xsd/imslticp_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imslticp_v1p0.xsd">
  <blti:title>Local Choral Explanations with content item</blti:title>
  <blti:description>Choral Explanations</blti:description>
  <blti:launch_url>#{request.host_with_port}</blti:launch_url>
  <blti:extensions platform="canvas.instructure.com">
  <lticm:property name="domain">#{request.host_with_port}</lticm:property>
  <lticm:property name="privacy_level">public</lticm:property>
 <lticm:options name="assignment_selection">
      <lticm:property name="canvas_icon_class">icon-lti</lticm:property>
      <lticm:property name="url">#{url}</lticm:property>
      <lticm:property name="message_type">ContentItemSelectionRequest</lticm:property>
      <lticm:property name="selection_height">700</lticm:property>
      <lticm:property name="selection_width">700</lticm:property>
    </lticm:options>
    <lticm:options name="link_selection">
      <lticm:property name="canvas_icon_class">icon-lti</lticm:property>
      <lticm:property name="url">#{url}</lticm:property>
      <lticm:property name="message_type">ContentItemSelectionRequest</lticm:property>
      <lticm:property name="selection_height">700</lticm:property>
      <lticm:property name="selection_width">700</lticm:property>
    </lticm:options>
    <lticm:options name="editor_button">
      <lticm:property name="canvas_icon_class">icon-lti</lticm:property>
      <lticm:property name="message_type">ContentItemSelectionRequest</lticm:property>
      <lticm:property name="text">Choral Explanations</lticm:property>
      <lticm:property name="url">#{url}</lticm:property>
    <lticm:property name="selection_height">700</lticm:property>
      <lticm:property name="selection_width">700</lticm:property>
    </lticm:options>
  </blti:extensions>
</cartridge_basiclti_link>
XML
  end

  private

  def check_is_content_item
    unless params[:lti_message_type] == 'ContentItemSelectionRequest'
      @title ||= "This launch is for content item only"
      @message ||= "This launch is misconfigured."
      render "lti/lti_401", :status => :unauthorized
    end
  end

end
