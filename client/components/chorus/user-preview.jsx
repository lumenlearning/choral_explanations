import React, {Component} from 'react';

export default class UserPreview extends Component{
  constructor(props){
    super(props);
  }

  anonymousUsername() {
    let first = [
      'absurd',
      'bashful',
      'cantankerous'
    ]

    let last = [
      'aardvark',
      'baboon',
      'catfish'
    ]

    let firstName = first[Math.floor(Math.random()* first.length)]
    let lastName = last[Math.floor(Math.random()* last.length)]

    return firstName + " " + lastName

  }

  render() {
    if(!this.props.user){
      return <div>
        <div>{this.anonymousUsername()}</div>
      </div>
    }

    return (
      <div>
        <div>{this.props.user.name}</div>
      </div>
    );
  }

}
