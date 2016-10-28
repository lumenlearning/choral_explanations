import React, {Component} from 'react';
import UserPreview from './user-preview.jsx'

export default class Response extends Component{
  constructor(props){
    super(props);
  }

  render() {
    return (
      <div>
        <h3>{this.props.response.attributes.name}</h3>
        <UserPreview user={this.props.response.attributes.user} />
        <div dangerouslySetInnerHTML={this.renderText()}></div>
      </div>
    );
  }

  renderText() {
    return {__html: this.props.response.attributes.description}
  }
}
