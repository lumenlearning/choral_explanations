import React, {Component} from 'react';
import ResponseActions from '../../actions/response-actions.jsx';
import ChorusActions from '../../actions/chorus-actions.jsx';
import Style from 'style';
import IframeHelper from '../../scripts/iframeHelper.js';

import Chorus from './chorus.jsx';
import SimpleRCE from "../_common/simple_rce.jsx";


export default class AddChorus extends Component {
  constructor(props) {
    super(props);
    this.state = {
      responseAdded: false,
      html: "",
      title: ""
    };

    this.input = this.input.bind(this);
    this.onResponseTextChange = this.onResponseTextChange.bind(this);
    this.onTitleChange = this.onTitleChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
  }

  onResponseTextChange(val) {
    this.setState({
      html: val
    })
  }

  onTitleChange(e) {
    this.setState({
      title: e.target.value
    })
  }

  onSubmit() {
    if (this.state.html != "" && this.state.title != "") {
      ResponseActions.createResponse(this.props.params, {
        name: this.state.title,
        description: this.state.html,
        license: 'cc_by'
      }, ()=>{ChorusActions.load(this.props.params);});

      this.setState({
        responseAdded: true
      })
    }
  }

  render() {

    return <div>
      {this.input()}
      <Chorus params={this.props.params} showResponses={true}/>
    </div>
  }

  input() {
    let styles = Style.styles()

    if (this.state.responseAdded) {
      return <p>Response Added.</p>
    } else {
      return <div>
        <h1>Add a response for this question.</h1>
        <div>
          <label htmlFor="title" className={Style.css(styles.titleLabel)}>Descriptive
            Title: </label>
          <input onChange={this.onTitleChange} type="text" id="title" className={Style.css(styles.titleInput)}/>
        </div>
        <SimpleRCE
            config={"basic"}
            onChange={this.onResponseTextChange}
        />
        <button className={Style.css(styles.showResponses)} onClick={this.onSubmit}>Add your
          response
        </button>
      </div>
    }
  }
}