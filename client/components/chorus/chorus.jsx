import React, {Component} from 'react'
import ChorusActions from '../../actions/chorus-actions.jsx'
import ChorusStore from '../../stores/chorus-store.jsx'
import Responses from './responses.jsx'
import Style from 'style'

export default class Chorus extends Component {
  constructor(props) {
    super(props);
    this.state = {chorus: null};

    this.onChange = this.onChange.bind(this);
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
    let style = Style.styles()

    if (!this.state.chorus) {
      return <p>Loading...</p>
    }
console.log(this.state)
    return (
        <div>
          <h1 className={Style.css(style.red)}>{this.state.chorus.attributes.name}</h1>
          <h2>{this.state.chorus.attributes.response_count} Responses</h2>
          <hr/>

          <div dangerouslySetInnerHTML={this.renderText()}></div>
          <hr/>
          <h2>Responses</h2>
          <Responses chorusId={this.props.params.chorusId}/>
        </div>
    );
  }

  renderText() {
    return {__html: this.state.chorus.attributes.description}
  }
}
