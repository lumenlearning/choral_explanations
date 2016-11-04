import React, {Component} from 'react';
import TinyMCE       from 'react-tinymce';

export default class SimpleRCE extends Component {

  constructor(props, state) {
    super(props, state);
    this.onChange = this.onChange.bind(this);
  }

  // Don't update because we don't want SimpleRCE to get a new instance
  shouldComponentUpdate(nextProps, nextState) {
    return false;
  }

  onChange(e){
    this.props.onChange(e.target.getContent());
  }

  config() {
    let config = this.props.config;

    if (config === "simple") {
      return({
        toolbar: false,
        menubar: false,
        statusbar: false,
        elementpath: false,
        min_height: 75,
        forced_root_block : ''
        //content_css: '/assets/themes/lumen.css.scss'
      });
    } else if (config === "basic") {
      return({
        toolbar: 'undo redo | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | table bullist numlist link | image media | code',
        plugins: 'table, code, autoresize, media, image',
        min_height: 300,
        autoresize_bottom_margin: 10,
        autoresize_max_height: 700,
        autoresize_min_height: 300,
        menubar: false,
        statusbar: true,
        elementpath: false,
        media_live_embeds: true
        //content_css: '/assets/themes/lumen.css.scss'
      });
    } else {
      return({
        menubar: true,
        statusbar: true,
        elementpath: true
      });
    }
  }

  render() {
    return (
      <TinyMCE
        content={this.props.content}
        config={this.config()}
        onChange={this.onChange}
      />
    )

  }

}
