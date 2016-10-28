import React, {Component} from 'react';
import ChorusActions from '../../actions/chorus-actions.jsx'
import ChorusStore from '../../stores/chorus-store.jsx'
import Responses from './responses.jsx'

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
    if (!this.state.chorus) {
      return <p>Loading...</p>
    }

    return (
        <div>
          <h1>{this.state.chorus.attributes.name}</h1>
          <Responses chorusId={this.props.params.chorusId}/>
        </div>
    );
  }
}
