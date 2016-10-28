var IframeHelper = {
  inIframe: function(){
    return self != top;
  },

  // get rid of double iframe scrollbars
  setHeight: function () {
    var default_height = $(document).height();
    default_height = default_height > 500 ? default_height : 500;

    parent.postMessage(JSON.stringify({
      subject: "lti.frameResize",
      height: default_height
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
  }
};

module.exports = IframeHelper;