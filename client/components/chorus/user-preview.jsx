import React, {Component} from 'react';
import Style from 'style';

export default class UserPreview extends Component{
  constructor(props){
    super(props);
  }

  // anonymousUsername() {
  //   let first = [
  //     'absurd',
  //     'bashful',
  //     'cantankerous'
  //   ]
  //
  //   let last = [
  //     'aardvark',
  //     'baboon',
  //     'catfish'
  //   ]
  //
  //   let firstName = first[Math.floor(Math.random()* first.length)]
  //   let lastName = last[Math.floor(Math.random()* last.length)]
  //
  //   return firstName + " " + lastName
  //
  // }

  render() {
    let style = Style.styles();
    let font = Style.font();

    if(!this.props.user){
      return <div className={Style.css(style.userPreviewWrapper)}>
        <div>
          <img className={Style.css(style.avatarImg)} src="/assets/blank-profile-picture.png" />
        </div>
        <div className={Style.css(style.userInfo)}>
          <div className={Style.css(font.bold)}>Anonymous User</div>
          <div className={Style.css(font.italic)}>Professor of Biology at Cambridge</div>
        </div>
      </div>
    }

    // {this.props.user.avatar ? <div>{this.props.user.avatar}</div> : null}
    return (
      <div className={Style.css(style.userPreviewWrapper)}>
        <div>
          <img className={Style.css(style.avatarImg)} src="/assets/blank-profile-picture.png" />
        </div>
        <div className={Style.css(style.userInfo)}>
          <div className={Style.css(font.bold)}>{this.props.user.name}</div>
          <div className={Style.css(font.italic)}>Professor of Biology at Cambridge</div>
        </div>
      </div>
    );
  }

}
