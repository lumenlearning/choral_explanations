import React, {Component} from 'react';
import UserPreview from './user-preview.jsx';
import Style from 'style';

export default class Response extends Component{
  constructor(props){
    super(props);
  }

  render() {
    let style = Style.styles();

    return (
      <div>
        <h3 className={Style.css(style.chorusH3)}>{this.props.response.attributes.name}</h3>
        <UserPreview user={this.props.response.attributes.user} />
        <div className={Style.css(style.chorusP)} dangerouslySetInnerHTML={this.renderText()}></div>
        <hr/>
      </div>
    );
  }

  renderText() {
    return {__html: this.props.response.attributes.description}
  }
}
