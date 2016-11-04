var IframeHelper = {
  inIframe: function () {
    return self != top;
  },

  // get rid of double iframe scrollbars
  setHeight: function (default_height=null) {
    if(!default_height){
      var body = document.body,
          html = document.documentElement;

      default_height = Math.max(body.scrollHeight, body.offsetHeight,
          html.clientHeight, html.scrollHeight, html.offsetHeight);
    }

    parent.postMessage(JSON.stringify({
      subject: "lti.frameResize",
      height: default_height,
      element_id: IframeHelper.getParameterByName('iframe_resize_id')
    }), "*");
  },

  // get rid of canvas-lms module navigation
  hideLMSNavigation: function () {
    parent.postMessage(JSON.stringify({
      subject: "lti.showModuleNavigation",
      show: false
    }), "*");
  },

  // show canvas-lms module navigation
  showLMSNavigation: function () {
    parent.postMessage(JSON.stringify({
      subject: "lti.showModuleNavigation",
      show: true
    }), "*");
  },

  // tell the parent iframe to scroll to top
  scrollParentToTop: function () {
    parent.postMessage(JSON.stringify({
      subject: "lti.scrollToTop"
    }), "*");
  },

  getParameterByName: function (name, url) {
    if (!url) {
      url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
  }
};

module.exports = IframeHelper;