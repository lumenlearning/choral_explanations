"use strict";
import React, {Component} from 'react';

export default class Base extends Component{
  constructor(props){
    super(props);

  }

  render(){
    return(
      <div>
        <h1>Hello!</h1>
        <div>
          {this.props.children}
        </div>
      </div>
    );
  }
}
