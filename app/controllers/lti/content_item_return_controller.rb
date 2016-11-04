class Lti::ContentItemReturnController < ApplicationController
  # https://www.imsglobal.org/specs/lticiv1p0/specification-3
  def create_tool_consumer
    IMS::LTI::ToolConsumer.new(Rails.application.secrets.lti_key, Rails.application.secrets.lti_secret)
  end

  def content_item_return
    raise "No return url for content item" unless params[:return_url].present?

    if params[:return_type] == 'iframe'
      do_return_launch(content_item_hash(embed_iframe(Chorus.find(params[:chorus_id]))))
    else
      do_return_launch(content_item_hash(lti_launch(Chorus.find(params[:chorus_id]))))
    end
  end

  private

  def do_return_launch(content_items)
    @consumer = create_tool_consumer
    tc = IMS::LTI::ToolConfig.new(:launch_url => params[:return_url])

    @consumer.set_config(tc)
    @consumer.resource_link_id = "fake"
    @consumer.lti_message_type = 'ContentItemSelection'
    @consumer.set_non_spec_param('content_items', content_items.to_json)

    @autolaunch = true
    render 'lti/lti_launch'
  end

  def content_item_hash(items)
    {
            "@context" => "http://purl.imsglobal.org/ctx/lti/v1/ContentItem",
            "@graph" => items
    }
  end

  def lti_launch(chorus)
    [
            {
                    "@type" => "LtiLinkItem",
                    "mediaType" => "application/vnd.ims.lti.v1.ltilink",
                    "url" => lti_chorus_url(chorus.id),
                    "title" => chorus.name,
            },
            {
                    "@type" => "LtiLinkItem",
                    "mediaType" => "application/vnd.ims.lti.v1.ltilink",
                    "url" => lti_chorus_url(chorus.id),
                    "title" => chorus.name,
                    "text" => chorus.name,
                    "lineItem" => {
                            "@type" => "LineItem",
                            "label" => chorus.name,
                            "reportingMethod" => "res:totalScore",
                            "maximumScore" => 10,
                            "scoreConstraints" => {
                                    "@type" => "NumericLimits",
                                    "normalMaximum" => 10,
                                    "totalMaximum" => 10
                            }
                    }
            }
    ]
  end

  def embed_iframe(chorus)
    id = "chorus_#{chorus.id}"
    url = chorus_url(chorus, iframe_resize_id: id)
    [{
             "@type" => "ContentItem",
             "mediaType" => "text/html",
             "text" => <<HTML,
<iframe id="#{id}" class="resizable" style="width: 100%; height: 500px;" src="#{url}">
</iframe>
HTML
             "placementAdvice" => {
                     "presentationDocumentTarget" => "embed"
             }
     }]
  end

end