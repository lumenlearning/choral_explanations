import React, {Component} from 'react';
import ChorusActions from '../../actions/chorus-actions.jsx';
import ChorusStore from '../../stores/chorus-store.jsx';
import Responses from './responses.jsx';
import Style from 'style';
import IframeHelper from '../../scripts/iframeHelper.js';

export default class Chorus extends Component {
  constructor(props) {
    super(props);
    this.state = {chorus: null, showResponses: false};

    this.onChange = this.onChange.bind(this);
    this.showResponses = this.showResponses.bind(this);
    this.responses = this.responses.bind(this);
  }

  componentDidMount() {
    ChorusStore.listen(this.onChange);
    ChorusActions.load(this.props.params);
    setTimeout(IframeHelper.setHeight, 150)
  }

  componentWillUnmount() {
    ChorusStore.unlisten(this.onChange);
  }

  onChange(state) {
    this.setState({chorus: state[this.props.params.chorusId]});
  }

  render() {
    let style = Style.styles();
    let font = Style.font();

    if (!this.state.chorus) {
      return <p>Loading...</p>
    }

    return (
        <div>
          <h1 className={Style.css(font.normal, style.chorusH1)}>{this.state.chorus.attributes.name}</h1>
          <h2 className={Style.css(font.normal, style.chorusH2)}>{this.state.chorus.attributes.response_count} Responses</h2>
          <hr className={Style.css(style.hr)}/>

          {this.responses()}
        </div>
    );
  }

  responses(){
    let style = Style.styles();
    let font = Style.font();

    if(this.state.showResponses){
      return <div>
        <Responses chorusId={this.props.params.chorusId}/>
      </div>
    } else {
      return <div style={{textAlign: 'center'}}>
        <div className={Style.css(font.normal)} dangerouslySetInnerHTML={this.renderText()}></div>
        <button className={Style.css(style.showResponses)} onClick={this.showResponses}>Show {this.state.chorus.attributes.response_count} Responses</button>
      </div>
    }
  }

  showResponses(){
    this.setState({
      showResponses: true
    })
  }

  renderText() {
    return {__html: this.state.chorus.attributes.description}
  }
}
