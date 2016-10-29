import React, {Component} from 'react'
import ChorusActions from '../../actions/chorus-actions.jsx'
import ChorusStore from '../../stores/chorus-store.jsx'
import Responses from './responses.jsx'
import Style from 'style'

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
  }

  componentWillUnmount() {
    ChorusStore.unlisten(this.onChange);
  }

  onChange(state) {
    this.setState({chorus: state[this.props.params.chorusId]});
  }

  render() {
    let style = Style.styles();

    if (!this.state.chorus) {
      return <p>Loading...</p>
    }

    return (
        <div>
          <h1 className={Style.css(style.red)}>{this.state.chorus.attributes.name}</h1>
          <h2>{this.state.chorus.attributes.response_count} Responses</h2>
          <hr/>

          <div dangerouslySetInnerHTML={this.renderText()}></div>
          {this.responses()}
        </div>
    );
  }

  responses(){
    if(this.state.showResponses){
      return <div>
        <hr/>
        <Responses chorusId={this.props.params.chorusId}/>
      </div>
    } else {
      return <div style={{textAlign: 'center'}}>
        <button onClick={this.showResponses}>Show {this.state.chorus.attributes.response_count} Responses</button>
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
