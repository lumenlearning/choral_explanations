import React, {Component} from 'react';

export default class UserPreview extends Component{
  constructor(props){
    super(props);
  }

  render() {
    if(!this.props.user){
      return <div>
        <div>Default user thing</div>
      </div>
    }

    return (
      <div>
        <div>{this.props.user.name}</div>
      </div>
    );
  }

}
